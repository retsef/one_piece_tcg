module Request::HoneyPot
  extend ActiveSupport::Concern

  included do
    def honeypot_fields
      { a_comment_body: 'Leave this empty' }
    end

    def honeypot_string
      'hp'
    end

    helper_method :honeypot_fields
    helper_method :honeypot_string

    def check_honeypot
      head :ok if params[:honeypot].present?
    end
  end

  class_methods do
    def protect_with_honeypot_for(*actions)
      prepend_before_action :check_honeypot, on: actions
    end
  end
end
