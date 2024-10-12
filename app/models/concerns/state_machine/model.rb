# http://railscasts.com/episodes/392-a-tour-of-state-machines?autoplay=true
module StateMachine
  class UnableTransition < StandardError
    attr_reader :record, :transition

    def initialize(transition = '<none>', record = nil)
      @record = record
      @transition = transition

      message = "Failed to go execute transition #{@transition} on record #{@record}: #{@record.errors.messages}"

      super(message)
    end
  end

  module Model
    extend ActiveSupport::Concern

    class_methods do
      attr_writer :states, :transitions

      def event_class
        StateMachine::Event
      end

      def states
        @states ||= []
      end

      # {
      #   transition_name: [{from: :state1, to: :state2}, {from: :state3, to: :state4}],
      # }
      def transitions
        @transitions ||= {}
      end

      def state(*names)
        define_model_callbacks(*names)

        names.each do |name|
          states << name

          define_method(:"#{name}?") { current_state == name.to_sym }
          define_method(:"#{name}_at") do
            return state_events.detect { |event| event.state == name }&.created_at if state_events.loaded?

            state_events.find_by(state: name)&.created_at
          end

          scope name, -> { where(current_state: name) }
          scope :"#{name}_at", ->(date) { joins(:state_events).where(state_events: { state: name, created_at: date }) }
        end
      end

      def transition(name, from:, to:)
        events = case from
        when Array then from.map { { from: _1, to: to } }
        when :all then states.map { { from: _1, to: to } }
        else [ { from: from, to: to } ]
        end

        transitions[name] ||= []
        transitions[name].push(*events)

        define_method(:"#{name}!") do
          raise(UnableTransition.new(name, self)) unless allow_transition?(to: to)

          self.transition_event = name
          run_callbacks(to) do
            result = update(current_state: to)

            raise(UnableTransition.new(name, self)) unless result
          end
        end

        define_method(:"may_#{name}?") { allow_transition?(to: to) }
      end
    end

    included do
      attr_accessor :transition_event

      with_options as: :subject, class_name: event_class.to_s, inverse_of: :subject do
        has_many :state_events, -> { order(created_at: :desc) }, dependent: :destroy
        has_one :last_state_event, -> { order(created_at: :desc) } # rubocop:disable Rails/HasManyOrHasOneDependent
      end

      scope :with_states, ->(*states) { where(current_state: states) }
      scope :without_states, ->(*states) { where.not(current_state: states) }

      scope :current_state, ->(state) { where(current_state: state) }

      before_create :set_initial_state

      def initial_state
        self.class.states.first
      end

      def current_state
        (super || initial_state)&.to_sym
      end

      def current_state=(next_state)
        unless allow_transition?(to: next_state)
          errors.add :current_state, "Cannot go to state #{next_state} from #{current_state}"
          return
        end

        state_events.build(state: next_state, previous_state: current_state, transition: transition_event) # audit
        super
      rescue UnableTransition => e
        Rails.logger.error(e)
        errors.add :current_state, "Cannot go to state #{next_state} from #{current_state}"
      end

      def state_rollback!
        previous_event, last_event = state_events.last(2)
        last_event.destroy!
        update(current_state: previous_event&.state || self.class.states.first)
      end

      # Return all available transitions from a given state with the next state
      def available_transitions(from_state = current_state)
        self.class.transitions.flat_map do |name, events|
          events.select { |event| event[:from] == from_state }
                .map { |event| { name => event[:to] } }
        end.reduce({}, :merge)
      end

      def available_transition_events(from_state = current_state)
        available_transitions(from_state).keys
      end

      # Return all available states from a given state
      def available_states(from_state = current_state)
        available_transitions(from_state).values.flatten
      end

      def allow_transition?(to:)
        return true if new_record? && initial_state == to
        return false if current_state == to

        available_states(current_state).include?(to) && valid?(to) && (try("allow_#{to}?") || true)
      end

      def was_transitioned?(from:)
        state_events.exists?(previous_state: from)
      end

      private

        def set_initial_state
          self.current_state = initial_state
        end
    end
  end
end
