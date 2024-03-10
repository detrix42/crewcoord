class ApplicationController < ActionController::Base
  include AlphaHelper
  before_action :set_log_tag
  # before_action :current_user, except: %i[logging_in register]


  protected
  def set_log_tag
    @logtag = "#{params[:controller]}::#{params[:action]}".bold
  end

  def log(lvl = :info, message = 'Forgot the message')
    # logger.tagged(@logtag) { logger.info message.public_send(color) }
    logger.tagged(@logtag) { logger.public_send(lvl, message) }
  end

  def confirm_level9_clearance

    if @current_user.level != 9
      render json: {
        msg: 'Level 9 clearance violation'
      }, status: :unauthorized
    end

  end


end
