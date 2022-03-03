class ExperienceUsersController < ApplicationController
  before_action :find_experience, only: [:create]

  def index
    @experience_users = ExperienceUser.all
  end

  def new
    @experience_user = ExperienceUser.new
  end

  def create
    @experience_user = ExperienceUser.new
    @experience_user.user = current_user
    @experience_user.experience = @experience
    @experience_user.save
    redirect_to experience_users_path
  end

  private

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end

  def experience_users_params
    params.require(:experience_user).permit()
  end
end
