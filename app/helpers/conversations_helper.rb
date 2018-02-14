module ConversationsHelper
  def last_message_sender_text(message)
    if message.user == current_user
      "You"
    else
      message.user.name
    end
  end
end
