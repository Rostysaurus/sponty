class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @message_count = Message.where(user: current_user)
    @recent_experience = @message_count.sort_by(&:created_at).reverse.first.chatroom.experience
  end
end
