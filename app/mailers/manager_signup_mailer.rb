# require 'sendgrid-ruby'
# include SendGrid

class ManagerSignupMailer < ApplicationMailer
  default from: 'detrix42@novasector.net'
  layout "manager_signup_mailer"
  # def company_signup_confirmation(business, manager, token)
  #   @manager = manager
  #   @company = business
  #   @token = token

    # msg = render_to_string 'mailers/company_signup_confirmation.html',
    #                        layout: 'layouts/company_signup/mailer.html.erb'

  #   msg = 'nothing here'
  #   from = SendGrid::Email.new(email: 'webmaster@crewcoord.net')
  #   to = SendGrid::Email.new(email: @manager.email)
  #   subject = "#{params[:company].name} signed up to CrewCoord.net"
  #   content = SendGrid::Content.new(type: 'text/html', value: msg)
  #   mail = SendGrid::Mail.new(from, subject, to, content)
  #   secret_key = Rails.application.credentials.dig(:sendgrid, :api_key)
  #   sg = SendGrid::API.new(api_key: secret_key)
  #
  #   response = sg.client.mail._('send').post(request_body: mail.to_json)
  #   log(:info, "[SendGrid headers]".cyan + " #{response.headers}\n".magenta)
  #   log(:info, "[SendGrid response status]".cyan + " #{response.status}".magenta)
  #   log(:info, "[SendGrid response body]".cyan + " #{response.body}".brown)
  #
  #   log(:info, "[SendGrid parsed body]".cyan + " #{response.parsed_body}".green)
  #
  # end

  def manager_signup_mailer
    @manager = params[:manager]
    @token = params[:token]
    @url = 'https://crewcoord.net/login'
    mail(to: @manager.email,
         subject: "CrewCord.net sign up confirmation")
  end
end
