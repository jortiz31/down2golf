class CoursecommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_course, only: [:new, :show, :edit, :create, :update, :destroy]
  def new
    puts "comment controller new action"
    @comment = Comment.new
    render 'comments/new'
  end
  def index
    @comments=Comment.all
  end
  def show
    @comment = Comment.find(params[:id])
  end
  def create
    @comment = @course.comments.create(comment_params)
    puts "comment created for course!"
    current_user.comments << @comment
    redirect_to @course
  end
  def edit
    @comment = Comment.find(params[:id])
    render "comments/edit"
  end
  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @course
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @course
  end

private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
