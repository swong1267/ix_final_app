module MessagesHelper
  def received_message?(message)
    message.recipient == current_user
  end
end