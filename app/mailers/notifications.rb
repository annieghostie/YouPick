class Notifications < ApplicationMailer
	default from: "yangyun@seas.upenn.edu"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.forgot_password.subject
  #
  def forgot_password(user)
    @greeting = "Hi"
    @name = user.name
    @password = user.password
    @email = user.email
    mail to: @email
  end

end
