class ExperiencesController < ApplicationController
  def show
    @experience = Experience.find(params[:id])
  end
end
