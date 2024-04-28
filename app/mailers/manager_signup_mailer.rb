# require 'sendgrid-ruby'
# include SendGrid

class ManagerSignupMailer < ApplicationMailer
  default from: '<no-reply>@novasector.net'.chomp

  def confirm_mailer(manager, tkn)
    @manager = manager
    @token = tkn
    @url = "#crewcoord.net/login"
    @link_url = "#{Rails.configuration.url_prefix}crew_manager_verification/confirm_token"
    mail(to: @manager.email,
         subject: "CrewCord.net sign up confirmation")
  end
end
