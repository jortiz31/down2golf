class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
    @courses = Course.all.paginate(:page => params[:page], :per_page => 4)
  end

  def show
    @course = Course.find(params[:id])
    @matches = @course.matches
    @match= Match.new
    @courses= Course.all
    @comment = Comment.new
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
  def set_course
    @course= Course.find(params[:id])
  end
  def course_params
    params.require(:course).permit(:name, :location, :image, :url, :price)
  end
end
