# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, "\\1en"
#   inflect.singular /^(ox)en/i, "\\1"
#   inflect.irregular "person", "people"
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'PWA'
  # inflect.acronym "RESTful"

  inflect.acronym 'KO'

  inflect.acronym 'DON'
  inflect.acronym 'ST'
  inflect.acronym 'OP'

  ST = 13
  OP = 6
  EB = 1

  (1..ST).each do |st|
    inflect.acronym "ST#{format '%02d', st}"
  end

  (1..OP).each do |op|
    inflect.acronym "OP#{format '%02d', op}"
  end

  (1..EB).each do |eb|
    inflect.acronym "EB#{format '%02d', eb}"
  end
end
