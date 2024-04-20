require 'jdl_rnd'
class CrewMemberController < ApplicationController
  def create_form
    unless @manager.present?
      @manager = CrewMember.new
    end
  end

  def create
    rnd = RND.new
    crds = creds
    @manager = CrewMember.new(creds)
    if @manager.save
      @token = rnd.token 10
      @url_prefix = Rails.configuration.url_prefix
      ManagerConfirmation.create(token: @token, manager_id: @manager.id)
      ManagerSignupMailer.confirm_mailer(@manager, @token).deliver_later
      flash[:success] = "Crew member created successfully"
      redirect_to crew_manager_verification_confirm_form_path
    else
      render :create_form
    end
  end

  def fetch
  end

  def update
  end

  def destroy
  end

  private
  def creds
    params.require(:crew_member).permit(:name, :email, :phone,
                                        :password, :password_confirmation)
  end
end
