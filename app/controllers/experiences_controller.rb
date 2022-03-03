class ExperiencesController < ApplicationController

def index
if params[:query].present?
   @experiences = Experience.search_by_name_and_address_and_event_type(params[:query])
 else
   @experiences = Experience.all
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
