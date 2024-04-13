# frozen_string_literal: true

module DurationHelper
  I18N_SCOPE_FULL = :'duration.in_words.format.full'
  DEFAULT_I18N_SCOPE = :'duration.in_words.format.compact'

  def duration_in_words(duration, options = {})
    raise_type_error(duration) unless duration.is_a?(ActiveSupport::Duration)

    locale, scope = parse_options(options)
    parts = duration.parts

    if parts.empty?
      key = "seconds.#{duration.value == 1 ? 'one' : 'other'}"
      return I18n.t(key, count: duration.value, scope: scope, locale: locale)
    end

    sentencify(parts, scope, locale)
  end

  private

    def parse_options(options)
      format = options.fetch(:format, :full)
      locale = options.fetch(:locale, I18n.locale)

      scope = format.to_s == "full" ? I18N_SCOPE_FULL : DEFAULT_I18N_SCOPE

      [locale, scope]
    end

    def sentencify(parts, scope, locale)
      parts
        .sort_by { |unit, _| ActiveSupport::Duration::PARTS.index(unit) }
        .map     do |unit, val|
          case val
          when 1 then I18n.t("#{unit}.one", count: val, scope: scope, locale: locale)
          else I18n.t("#{unit}.other", count: val, scope: scope, locale: locale)
          end
        end
        .to_sentence(sentence_options(scope, locale))
    end

    def sentence_options(scope, locale)
      I18n.t(:support, scope: scope, locale: locale, default: { locale: locale })
    end

    def raise_type_error(type)
      raise TypeError, "no implicit conversion of #{type.class} into ActiveSupport::Duration"
    end
end
