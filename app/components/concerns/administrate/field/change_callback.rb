module Administrate::Field::ChangeCallback
  extend ActiveSupport::Concern

  included do
    def change_callback_url
      return @change_callback_url if @change_callback_url

      @change_callback_url = field.options[:change_callback_url]
      @change_callback_url = send(@change_callback_url) if @change_callback_url.is_a? Symbol
      @change_callback_url = @change_callback_url.call(field.resource) if @change_callback_url.is_a? Proc
    end

    def change_callback_param
      field.options[:change_callback_param] || field.attribute
    end
  end
end
