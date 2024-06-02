class PasswordResetController < ApplicationController
  def prompt_email

  end

  def reset
    @link_url = "#{Rails.configuration.url_prefix}password_reset/"
    # reset form
  end

  def reset_submit
    rnd = RND.new
    email = params.permit(:email)[:email]
    code = rnd.token(16)
    @link_url = "#{Rails.configuration.url_prefix}password_reset/update"

    PasswordResetCode.create(email: email, code: code)
    prefix = "[INITIATE PASSWORD RESET] => ".brown
    log :info, prefix + "for email: #{email}".red
    PasswordResetMailer.reset_code(email, code).deliver_later
    log :info, prefix + "email sent to #{email}".cyan
    session[:password_reset_email] = email
    redirect_to password_reset_reset_path
  end

  # verify reset code to allow password change
  def reset_verify
    @code = params[:code]
    @email = session[:password_reset_email]
    @reset = PasswordResetCode.find_by(code: @code, email: @email)
    if @reset.present?
      @reset.destroy
      flash[:success] = "Password reset code verifcation successful"
      redirect_to password_reset_update_path
    else
      flash[:error] = "Password reset failed"
      redirect_to password_reset_reset_path
    end
  end


  def update
    # new password form
  end

  def update_submit
    @email = session[:password_reset_email]
    @manager = CrewMember.find_by(email: @email)
    password1 = params[:password]
    password2 = params[:password_confirmation]
    if @manager.update(password: password1, password_confirmation: password2)
      session.delete(:password_reset_email)
      msg = "Successfully updated password"
      log :info, "[PASSWORD_RESET] ==>".cyan + msg.green
      flash[:success] = msg
      redirect_to login_form_path
    end
  end
end
