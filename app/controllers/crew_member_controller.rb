require 'jdl_rnd'
class CrewMemberController < ApplicationController

  def create_actual
    rnd = RND.new
    data = payload
    ccdata = extract_cc_info(data)
    @manager = CrewMember.new(data)
    if @manager.save
      @token = rnd.token 4
      @url_prefix = Rails.configuration.url_prefix
      session[:vorgon] = @manager
      # going to save the credit card info in the session hash.
      # postpone saving credt card data into DB until new use is
      # verified. code nameing the hash key.
      session[:johnyfive] = ccdata
      ManagerConfirmation.create(token: @token, manager_id: @manager[:id])
      ManagerSignupMailer.confirm_mailer(@manager, @token).deliver_later
      flash[:success] = "Crew member created successfully"
      redirect_to crew_manager_verification_confirm_form_path
    else
      flash[:error] = @manager.errors.full_messages.join('<br/>').html_safe
      redirect_to crew_member_create_url
    end
    # 4111111111111111
    # 01/01/2030
  end

  def create
    @tier = params.permit(:tier)[:tier]
    unless @manager.present?
      @manager = CrewMember.new
    end
  end

  def fetch
  end

  def update
  end

  def destroy
  end

  private
  def payload
    params.require(:crew_member).permit(:name, :email, :phone, :credit_card,
                                        :expiration_date, :CVV,
                                        :password, :password_confirmation)
  end

  def extract_cc_info(data)
    cc = {}
    keys = [:credit_card, :expiration_date, :CVV]
    keys.each do |key|
      cc[key] = data.delete(key)
    end

    cc
  end
end
