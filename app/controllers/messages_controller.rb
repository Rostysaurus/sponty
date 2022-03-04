class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to experience_path(params[:experience_id], anchor: "message-#{@message.id}")
    else
      render "experiences/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
