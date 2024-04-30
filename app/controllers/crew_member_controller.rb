require 'jdl_rnd'
class CrewMemberController < ApplicationController

  def create_actual
    rnd = RND.new
    @manager = CrewMember.new(creds)
    if @manager.save
      @token = rnd.token 4
      @url_prefix = Rails.configuration.url_prefix
      session[:vorgon] = @manager
      ManagerConfirmation.create(token: @token, manager_id: @manager[:id])
      ManagerSignupMailer.confirm_mailer(@manager, @token).deliver_later
      flash[:notice] = "Crew member created successfully"
      redirect_to crew_manager_verification_confirm_form_path
    else
      flash[:alert] = @manager.errors.full_messages
      redirect_to crew_member_create_url
    end

  end

  def create
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
  def creds
    params.require(:crew_member).permit(:name, :email, :phone,
                                        :password, :password_confirmation)
  end
end
