class ApplicationController < ActionController::Base
  include AlphaHelper

  before_action :set_log_tag # adds a prefix to log entries
  before_action :manager # method located in AlphaHelper


  # before_action :current_user, except: %i[logging_in register]
  add_flash_types :error, :success

  protected
  def check_manager_business
    if @manager.present?
      unless @manager.business_id.present?
        redirect_to business_create_path
      end
    end
  end

  def set_log_tag
    @logtag = "<#{params[:controller]}::#{params[:action]}>".bold
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

  # used to strip color code escape squences I use in log
  # messages, so the same string can be used in flash messages
  def strip_color_codes(string)
    string.gsub(/\e\[(\d+;)*\d+m/, '')
  end

end
