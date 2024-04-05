module Broadcastable
  extend ActiveSupport::Concern

  included do
    after_create_commit :broadcast_create
    after_update_commit :broadcast_update
    after_destroy_commit :broadcast_destroy

    if include?(StateMachine::Model)
      states.each do |state|
        send(:"after_#{state}", :"broadcast_#{state}")
      end
    end

    private

      def broadcast_create
        event_name = "#{model_name.name}::CreateEvent"
        return unless Object.const_defined?(event_name)

        event_name.constantize.new(model_name.param_key => self).publish
      end

      def broadcast_update
        event_name = "#{model_name.name}::UpdateEvent"
        return unless Object.const_defined?(event_name)

        event_name.constantize.new(model_name.param_key => self).publish
      end

      def broadcast_destroy
        event_name = "#{model_name.name}::DestroyEvent"
        return unless Object.const_defined?(event_name)

        event_name.constantize.new(model_name.param_key => self).publish
      end

      if include?(StateMachine::Model)
        states.each do |state|
          define_method(:"broadcast_#{state}") do
            event_name = "#{model_name.name}::#{state.to_s.classify}Event"
            return unless Object.const_defined?(event_name)

            event_name.constantize.new(model_name.param_key => self).publish
          end
        end
      end
  end
end
