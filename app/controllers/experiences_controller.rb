class ExperiencesController < ApplicationController
  before_action :experience_users_all, only: [:show]
  # before_action :find_user, only: [:show]


def index

  if params[:query].present?
    @experiences = Experience.search_by_name_and_address_and_event_type(params[:query])
  else
    @experiences = Experience.all
  end

  @markers = @experiences.geocoded.map do |experience|
    {
      lat: experience.latitude,
      lng: experience.longitude,
      info_window: render_to_string(partial: "info_window", locals: { experience: experience }),
    }
  end

end

def show
  @experience = Experience.find(params[:id])
  @chatroom = @experience.chatroom
  @message = Message.new
  @favorite = ExperienceUser.find_by(user: current_user, experience: @experience)
end

def new
  @experience = Experience.new
end

def create
  @experience = Experience.new(experience_params)
  @experience.user = current_user
  @experience.save
  chatroom = Chatroom.create(name: "#{@experience.name}-chatroom")
  @experience.chatroom = chatroom
  redirect_to experiences_path
end

def destroy
    @experience = Experience.find(params[:id])
    @experience.user = current_user
    @experience.destroy
    redirect_to experiences_path
end

private

def find_user
  @user = User.find(params[:id])
end

def experience_users_all
  @experience_users = ExperienceUser.all
end

def experience_params
  params.require(:experience).permit(:name, :address, :busyness, :event_type, :photo)
end
end
