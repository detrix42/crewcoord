class PasswordResetMailer < ApplicationMailer
  default from: 'webmaster@novasector.net'.chomp
  def reset_code(email, code)
    @code = code
    mail(to: email, subject: "CrewCoord Password Recovery")
  end

end
