class ApplicationMailer < ActionMailer::Base
  default from: "webmaster@crewcoord.net"
  layout "manager_signup_mailer"
end
