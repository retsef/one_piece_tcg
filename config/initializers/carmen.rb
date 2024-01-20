Rails.configuration.to_prepare do
  require 'carmen'

  Carmen.i18n_backend.locale = :it

  Carmen.append_data_path Rails.root.join('vendor/iso_data/base')
  Carmen.append_data_path Rails.root.join('vendor/iso_data/overlay')
end
