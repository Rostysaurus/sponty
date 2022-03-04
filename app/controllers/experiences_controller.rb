class ExperiencesController < ApplicationController
  before_action :experience_users_all, only: [:show]

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
end

def new
  @experience = Experience.new
end

def create
  @experience = Experience.new(experience_params)
  chatroom = Chatroom.create(name: "#{@experience.name}-chatroom")
  @experience.chatroom = chatroom
  @experience.save
  redirect_to new_experience_path
end

private

def experience_users_all
  @experience_users = ExperienceUser.all
end

def experience_params
  params.require(:experience).permit(:name, :address, :busyness, :event_type)
end
end
