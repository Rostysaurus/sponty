class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @experiences = Experience.first(3)
  end

  def profile
    @experience_users = ExperienceUser.where(user: current_user)
    @experiences = Experience.where(user: current_user)
    @message_count = Message.where(user: current_user).lenght
  end
end
