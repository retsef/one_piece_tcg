# An ActiveRecord validator for any url field that you would use with effective_url or otherwise
#
# validates :website, url: true

class UrlValidator < ActiveModel::EachValidator
  PATTERN = %r{\Ahttps?://\w+.+\Z}

  def validate_each(record, attribute, value)
    return if value.blank?
    return if PATTERN.match?(value)

    record.errors.add(attribute, options[:message] || :invalid)
  end
end
