# An ActiveRecord validator for any email field that you would use with effective_email or otherwise
#
# validates :email, email: true

class EmailValidator < ActiveModel::EachValidator
  PATTERN = /\A.+@.+\..+\Z/

  def validate_each(record, attribute, value)
    return if value.blank?
    return if PATTERN.match?(value)

    record.errors.add(attribute, options[:message] || :invalid)
  end
end
