class CompanySignupMailer < ApplicationMailer
  default from: 'signup_mailer@crewcoord.net'

  def company_signup_confirmation
    @manager = params[:crew_manager]
    @company = params[:company]
    @token = params[:token]
    @url = 'https://crewcoord.net/login'
    main(to: @manager.email,
         subject: 'Crew Manager sign up email verification')
  end
end
