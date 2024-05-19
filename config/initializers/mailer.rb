# frozen_string_literal: true

user = Rails.application.credentials.dig(:crewcoord, :email_signup, :user)
password = Rails.application.credentials.dig(:crewcoord, :email_signup, :password)
ActionMailer::Base.smtp_settings = {
  domain: "novasector.net",
  address: "novasector.net",
  port: 587,
  authentication: "plain",
  enable_starttls_auto: true,
  # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE,
  # openssl_verify_mode: 'none',
  user_name: user + "@novasector.net",
  password: password,
  read_timeout: 600, # Time in seconds, you can increase it accordingly.
  open_timeout: 60, # Time in seconds, this is for the opening connection.

}
