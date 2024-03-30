# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  domain: "novasector.net",
  address: "mail.novasector.net",
  port: 587,
  authentication: "plain",
  enable_starttls_auto: true,
  # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE,
  openssl_verify_mode: 'none',
  user_name: "webmaster@crewcoord.net",
  password: "Klingon8085",
  read_timeout: 600, # Time in seconds, you can increase it accordingly.
  open_timeout: 60, # Time in seconds, this is for the opening connection.

}
