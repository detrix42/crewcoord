class CrewManagerVerificationController < ApplicationController

  def confirm_form
    @token = params.permit([:token])

  end

  def confirm_token
    manager = CrewMember.find_by(id: session[:vorgon]["id"])
    mc = ManagerConfirmation.find_by(manager_id: manager["id"])
    tkn = mc[:token]
    exp_time = mc.created_at + 5.minutes
    tNow = Time.now.utc
    if tkn.present? and tNow < exp_time

      # manager = CrewMember.find_by(id: tkn.manager_id)
      ptkn = params[:token]
      if manager.present? and tkn == ptkn
        manager.update(email_verified: true, is_crew_manager: true)
        flash[:success] = "Email verified successfully!"
        mc.destroy

        # manager email verified. now save the credit card data to DB
        ccdata = session.delete(:johnyfive)
        shard = Shard.new
        shard['number'] = ccdata["credit_card"]
        shard['exp_date'] = ccdata["expiration_date"]
        shard[:cvv] = ccdata["CVV"]
        shard.crew_member_id = manager.id
        shard.save

        session[:vorgon] = nil
        # auto login in
        session[:manager_id] = manager.id
        session[:manager] = manager
        session[:manager_login_time] = Time.now

        # now crew manager needs to create a business profile
        redirect_to business_create_path
      else
        tMinus = ((exp_time - tNow) / 60).ceil
        flash[:error] = "Verification code failed!<br/>You have #{tMinus} minutes left to try again"
        redirect_to crew_manager_verification_confirm_form_path
      end
    else
        flash[:error] = "Token has expired\nYou will need to re-submit "
        # if token expires, delete token and crew manager
        # associated with it, so the user can try again.
        # Must delete since there can be no duplicate
        # name or email.
        mc.destroy
        manager.destroy
        session[:vorgon] = nil

        redirect_to crew_member_create_path
    end
    # redirect_to root_url
  end
end

