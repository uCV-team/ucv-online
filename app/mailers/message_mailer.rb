class MessageMailer < ApplicationMailer
  # Hire candidate notification
  def send_notification_to_candidate(user_id, message_id)
    @user = User.find_by(id: user_id)
    @message = Message.find_by(id: message_id)
    @current_locale = @user.locale
    mail(
      to: @user.email,
      subject: "[PubliCV] #{@message.name}",
      reply_to: @message.email
    )
  end
end
