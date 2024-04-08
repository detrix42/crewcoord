require 'jdl_rnd'

class SessionController < ApplicationController
  def signup
    rnd = RND.new
    @token = rnd.token


    @business = Business.new
    @business.build_crew_member
  end

  def login_form
  end

  def login_actual
    creds = manager_creds
    manager = CrewMember.find_by(email: creds[:email])

    if manager.present? && manager.authenticate(creds[:password])
      @current_user = manager
      session[:manager_id] = @current_user.id
      session[:manager_login_time] = Time.now
      msg = "[LOGIN ACTUAL]".black.bg_brown + "#{@current_user.name} logged in. (Authenticated)".green
      log :info, msg
      flash[:notice] = msg
      redirect_to root_path
    else
      flash[:error] = "[LOGIN FAILED] check your credentials"
      redirect_to login_form_url

    end

    def logout
      _date = theDate.black.bg_brown
      log :info, "[LOGOUT::#{_date}] #{@current_user.name}".green.bg_black
      if params[:manager_id] == session[:manager_id]
        session[:manager_id] = nil
        session[:manager_login_time] = nil
        @current_user = nil
      end
    end

  end


  private
  def manager_creds
    params.permit(:email, :password)
  end

end
