class CompanySignupMailer < ApplicationMailer
  default from: 'signup_mailer@crewcoord.net'

  def company_signup_confirmation(company, crew_manager)
    @manager = crew_manager
    @url = 'https://crewcoord.net/login'
    main(to: @manager.email,
         subject: 'Crew Manager sign up email verification')
  end
end
