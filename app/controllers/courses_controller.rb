class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  def show
    @course = Course.find(params[:course_id])
    @matches = @course.matches
  end

  private
  def course_params
    params.require(:course).permit(:name, :location, :image, :url, :price)
  end
end
