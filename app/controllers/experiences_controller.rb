class ExperiencesController < ApplicationController
  def create
    @experience = Experience.new(experience_params)
    @experience.save
    redirect_to experience_path
  end

  private
  def experience_params
    params.require(:experience).permit(:name, :address, :busyness, :event_type)
  end
end
