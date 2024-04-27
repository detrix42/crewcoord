class CrewManagerVerificationController < ApplicationController

  def confirm_form
    @token = params.permit([:token])

  end

  def confirm_token
    tkn = ManagerConfirmation.find_by(token: params[:token])
    if tkn and Time.now < tkn.created_at + 5.minutes
      manager = CrewMember.find_by(id: tkn.manager_id)
      if manager
        manager.update(email_verified: true, is_crew_manager: true)
        flash[:success] = "Email verified successfully!"
        tkn.destroy

        # auto login in
        session[:manager_id] = manager.id
        session[:manager] = manager
        session[:manager_login_time] = Time.now

        # now crew manager needs to create a business profile
        redirect_to business_create_path
      else
        flash[:notice] = "Email confirmation failed!"
        redirect_to root_url
      end
    else
      if Time.now < tkn.created_at + 5.minutes
        flash[:notice] = "Token has expired"
        # if token expires, delete token and crew manager
        # associated with it, so the user can try again.
        # Must delete since there can be no duplicate
        # name or email.
        tkn.destroy
        manager.destroy
      else
        flash[:notice] = "Invalid token"
      end
      redirect_to root_url
    end
  end
end
