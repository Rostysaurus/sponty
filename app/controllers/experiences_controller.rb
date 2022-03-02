class ExperiencesController < ApplicationController
<<<<<<< HEAD

def new
  @experience = Experience.new
end

=======
  def show
    @experience = Experience.find(params[:id])
  end
>>>>>>> c60ca3bc67f0f4c0cf146df66fcde6ed41f0e9bc
end
