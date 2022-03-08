class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
    @experiences_top_3 = Experience.first(3)

    if params[:query].present?
      @experiences = Experience.search_by_name_and_address_and_event_type(params[:query])
    else
      @experiences = Experience.all
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'experiences/list', locals: { experiences: @experiences }, formats: [:html] }
    end
  end

  def profile
    @experience_users = ExperienceUser.where(user: current_user)
    @experiences = Experience.where(user: current_user)
    @message_count = Message.where(user: current_user)
    @experience_users = ExperienceUser.where(user: current_user)
  end
end
