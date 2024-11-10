Rails.application.configure do
  # Configure Solid Errors
  config.solid_errors.connects_to = { database: { writing: :errors } }

  # config.solid_errors.send_emails = false
  # config.solid_errors.email_from = ""
  # config.solid_errors.email_to = ""

  # config.solid_errors.username = Rails.application.credentials.dig(:solid_errors, :username)
  # config.solid_errors.password = Rails.application.credentials.dig(:solid_errors, :password)
end
