class ExperiencesController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 20ca08eb48ea6dbb9c988d9c405f11157eb5e8b9

def new
  @experience = Experience.new
end

<<<<<<< HEAD
=======
  def show
    @experience = Experience.find(params[:id])
  end
>>>>>>> c60ca3bc67f0f4c0cf146df66fcde6ed41f0e9bc
=======
  def show
    @experience = Experience.find(params[:id])
  end
 
>>>>>>> 20ca08eb48ea6dbb9c988d9c405f11157eb5e8b9
end
