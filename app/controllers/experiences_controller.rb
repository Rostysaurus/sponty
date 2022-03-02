class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end
end
