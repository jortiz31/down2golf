class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @matches = @course.matches
  end

  def edit
    render :edit
  end

  def update
    @course.update(course_params)
  end

  def destroy
    @course.destroy
  end
  
  private
  def course_params
    params.require(:course).permit(:name, :location, :image, :url, :price)
  end
end
