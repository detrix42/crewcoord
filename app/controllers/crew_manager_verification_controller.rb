class CrewManagerVerificationController < ApplicationController

  def confirm_form
    @token = params.permit([:token])

  end

  def confirm_token
    tkn = ManagerConfirmation.find_by(token: params[:token])
    if tkn
    manager = CrewMember.find_by(id: tkn.manager_id)
    if manager
      manager.update(email_verified: true)
      flash[:success] = "Email verified successfully!"
      tkn.destroy
      redirect_to root_url
    else
      flash[:error] = "Invalid token"
      redirect_to root_url
    end
    else
      flash[:error] = "Invalid token"
      redirect_to root_url
    end
  end
end
