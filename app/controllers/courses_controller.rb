class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @matches = @course.matches
    respond_with @course
  end

  private
  def course_params
    params.require(:course).permit(:name, :location, :image, :url, :price)
  end
end
