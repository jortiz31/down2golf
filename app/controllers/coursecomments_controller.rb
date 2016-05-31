class CoursecommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
    puts "comment controller new action"
    @course = Course.find(params[:course_id])
    @comment = Comment.new
  end
  def index
    @comments=Comment.all
  end
  def show
    @comment = Comment.find(params[:id])
  end
  def create
    @course= Course.find(params[:course_id])

    if @course
      @comment = @course.comments.create(comment_params)
      puts "comment created for course!"
      redirect_to @course
    end
    if @course
      @comment = @course.comments.create(comment_params)
      redirect_to @course
    end
    current_user.comments << @comment
  end
  def edit
    render :edit
  end
  def update
    @course= Course.find(params[:course_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
  end
  def destroy
    @course= Course.find(params[:course_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @course
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
