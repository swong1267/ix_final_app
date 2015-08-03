class MessagesController < ApplicationController
  def index
    redirect_to inbox_messages_path
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create subject: message_params[:subject], body: message_params[:body]
    @message.recipient = User.find_by(email: message_params[:recipient])
    @message.sender = current_user
    if @message.save
      redirect_to inbox_messages_path
    else
      render 'new'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    received_message = received_message? @message
    @message.destroy
    if received_message
      redirect_to inbox_messages_path
    else
      redirect_to sent_mail_messages_path
    end
  end

  def inbox
    @messages = Message.all
  end

  def sent_mail
    @messages = Message.all
  end

  private

  def message_params
    params.require(:message).permit(:subject, :recipient, :body)
  end

  def received_message?(message)
    message.recipient == current_user
  end
end