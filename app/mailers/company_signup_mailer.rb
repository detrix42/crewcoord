class CompanySignupMailer < ApplicationMailer
  default from: 'webmaster@crewcoord.net'

  def company_signup_confirmation
    @manager = params[:manager]
    @company = params[:company]
    @token = params[:token]
    @url = 'https://crewcoord.net/login'
    mail(to: @manager.email,
         subject: "#{@company.name} sign up to CrewCoord.net")
  end
end
