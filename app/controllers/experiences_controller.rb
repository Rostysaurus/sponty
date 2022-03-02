class ExperiencesController < ApplicationController

def index
  @experiences = Experience.all

  @markers = @experiences.geocoded.map do |experience|
    {
      lat: experience.latitude,
      lng: experience.longitude,
      info_window: render_to_string(partial: "info_window", locals: { experience: experience }),
      image_url: 'cl_image_path experience.photo.key'
    }
  end
end

def show
  @experience = Experience.find(params[:id])
end

def new
  @experience = Experience.new
end

def create
  @experience = Experience.new(experience_params)
  @experience.save
  redirect_to new_experience_path
end

private
def experience_params
  params.require(:experience).permit(:name, :address, :busyness, :event_type)
end

end
