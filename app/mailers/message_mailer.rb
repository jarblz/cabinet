class MessageMailer < ApplicationMailer
  def new_message(message)
    @message = message
    @receiver = message.conversation.with(@message.user)
    set_url(message)
    mail(to: @receiver.email, subject: 'You have a new recommendation!')
  end

  def set_url(message)
    @url = conversations_path(message.conversation.id)
  end
end
