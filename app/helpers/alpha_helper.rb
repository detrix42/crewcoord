require 'jdl_rnd'

module AlphaHelper
  def theDate
    dt = Time.now
    day_suffix = 'st'
    day = dt.day
    day_suffix = case day
    when 2
      'nd'
    when 3
      'rd'
    else
      'th'
                 end

    dt.strftime "%A, %b %d#{day_suffix} %Y"
  end

  def current_user
    if session[:user_id]
      @current_user ||= CrewMemember.find_by(id: session[:user_id])
    else
      @current_user = CrewMember.new
    end
  end

  def base_img_url
    "https://lc.novasector.net/images/product/"
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !@current_user.nil?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
    recirect_back_or(root_path)
  end

  def recirect_back_or(default)
    redirect_to session[:forwarding_url] || default
    session.delete :forwarding_url
  end






end
