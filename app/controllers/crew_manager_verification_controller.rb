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

        session[:vorgon] = nil
        # auto login in
        session[:manager_id] = manager.id
        session[:manager] = manager
        session[:manager_login_time] = Time.now

        # now crew manager needs to create a business profile
        redirect_to business_create_path
      else
        tMinus = ((exp_time - tNow) / 60).ceil
        flash[:alert] = "Verification code failed!<br/>You have #{tMinus} minutes left to try again"
        redirect_to crew_manager_verification_confirm_form_path
      end
    else
        flash[:alert] = "Token has expired\nYou will need to re-submit "
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

