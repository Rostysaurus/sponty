class ExperienceUsersController < ApplicationController
  before_action :find_experience, only: [:create]
  before_action :find_experience_user, only: [:destroy]

  def index
    @experience_users = ExperienceUser.where(user: current_user)
  end

  def new
    @experience_user = ExperienceUser.new
  end

  def create
    @experience_user = ExperienceUser.new
    @experience_user.user = current_user
    @experience_user.experience = @experience
    @experience_user.save
    redirect_to experience_path(@experience)
  end

  def destroy
    @experience_user.destroy
    redirect_to experience_path(@experience_user.experience)
  end

  private

  def find_experience_user
    @experience_user = ExperienceUser.find(params[:id])
  end

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end

  def experience_users_params
    params.require(:experience_user).permit()
  end
end
