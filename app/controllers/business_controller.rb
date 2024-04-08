require 'jdl_rnd'

class BusinessController < ApplicationController
  def create
    rnd = RND.new
    @token = rnd.token 64

    b_prms = create_params
    manager = CrewMember.new(b_prms[:crew_member_attributes])
    manager.is_crew_manager = true

    @business = Business.new(b_prms)
    @business.crew_member = manager

    if @business.save
      log(:info, "Business #{@business.name} created successfully")
      manager.business = @business
      # ManagerConfirmation.new(manager_id: manager.id, token: @token).save
    else
      log(:error, "Business #{@business.name} " +
        "not created for the followig reasons:\n" +
        "#{@business.errors.full_messages.join("\n")}")
    end

    if manager.errors.empty?
      log(:info, "Crew Member (Manager) created successfully")
    else
      log(:error, "Crew Member (Manager)" +
        " not created for the following reasons:\n" +
        "#{manager.errors.full_messages.join("\n")}")
    end

    if @business.errors.empty?
      # send_signup_confirmation(@business, manager, @token)
      # skipping sending email.
      #CompanySignupMailer.with(company: @business, manager: manager, token: @token)
      #                    .company_signup_confirmation.deliver_later
      log(:info, "Business created successfully")
      redirect_to '/'
    else
      log(:error, "Failed to create business\n#{@business.errors.full_messages.join("\n")}")
      render 'session/create'
end
  end

  private
  def create_params
  params.require(:business).permit(:name, :email, :phone,
                                   :address1, :address2,
                                   :city, :state, :zipcode,
         crew_member_attributes: [ :name, :email,
                                   :password, :password_confirmation])
  end

  def send_signup_confirmation(company, manager, token)
    @manager = manager
    @company = company
    @token = token

    msg = render_to_string template: 'mailers/company_signup_confirmation',
                           layout: 'mailer'

    from = SendGrid::Email.new(email: 'webmaster@crewcoord.net')
    to = SendGrid::Email.new(email: @manager.email)
    subject = "#{@company} signed up to CrewCoord.net"
    content = SendGrid::Content.new(type: 'text/html', value: msg)
    mail = SendGrid::Mail.new(from, subject, to, content)
    secret_key = Rails.application.credentials.dig(:sendgrid, :api_key)
    sg = SendGrid::API.new(api_key: secret_key)

    response = sg.client.mail._('send').post(request_body: mail.to_json)
    log(:info, "[SendGrid headers]".cyan + " #{response.headers}\n".magenta)
    log(:info, "[SendGrid response status]".cyan + " #{response.status_code}".magenta)
    log(:info, "[SendGrid response body]".cyan + " #{response.body}".brown)

    log(:info, "[SendGrid parsed body]".cyan + " #{response.parsed_body}".green)
  end
end
