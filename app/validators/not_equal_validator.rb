class NotEqualValidator < ActiveModel::EachValidator
  def validate(record)
    super
    @past = {}
  end

  def validate_each(record, attribute, value)
    @past ||= {}
    @past.each do |k, past_value|
      error_message = I18n.t('errors.messages.should_not_be_equal_to', count: record.class.human_attribute_name(k))
      record.errors.add(attribute, error_message) if past_value == value
    end
    @past[attribute] = value
  end
end
