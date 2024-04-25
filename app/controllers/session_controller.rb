require 'jdl_rnd'

class SessionController < ApplicationController
  before_action :check_manager_business, except: [:login_actual, :login_form, :signup]
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

      @manager = manager
      session[:manager] = @manager
      session[:manager_id] = @manager.id
      session[:manager_login_time] = Time.now
      msg = "#{@manager['name']} logged in. \n(Authenticated)".green
      log :info, "[LOGIN ACTUAL] => ".black.bg_brown + msg
      flash[:notice] = strip_color_codes(msg)
      redirect_to root_path
    else
      flash[:error] = "[LOGIN FAILED] check your credentials"
      log :error, "[LOGIN FAILED] for #{creds[:email]}".red
      redirect_to :login_form

    end
  end

  def logout
    _date = theDate.black.bg_brown
    log :info, "[LOGOUT::#{_date}] #{manager['name']}".green.bg_black
    if @manager[:id] == session[:manager_id]
      session[:manager_id] = nil
      session[:manager_login_time] = nil
      session[:manager] = nil
    end
    @manager = nil
    redirect_to root_path
  end


  private
  def manager_creds
    params.permit(:email, :password)
  end

end
