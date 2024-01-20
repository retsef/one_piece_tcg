Rails.configuration.to_prepare do
  require 'local_time'

  LocalTime.default_time_format = '%e %B %Y alle %H:%M'
  LocalTime.default_date_format = '%e %b %Y'
end
