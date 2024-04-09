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

  def manager
    if session[:manager_id]
      @manager ||= CrewMember.find_by(id: session[:manager_id])
    else
      @manager = nil
    end
  end

  def base_img_url
    "https://crewcoord.net/public/images"
  end

  def manager?(mgr)
    mgr == manager
  end

  def logged_in?
    !@manager.nil?
  end

  def log_out
    session.delete :user_id
    @manager = nil
    recirect_back_or(root_path)
  end

  def recirect_back_or(default)
    redirect_to session[:forwarding_url] || default
    session.delete :forwarding_url
  end






end
