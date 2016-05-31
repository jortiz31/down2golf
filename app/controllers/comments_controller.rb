class CommentsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @match = Match.find(params[:match_id])
    @comment = Comment.new
  end
  def index
    @comments=Comment.all
  end
  def show
    @comment = Comment.find(params[:id])
  end
  def create
    @match= Match.find(params[:match_id])
    @course = Course.find(params[:course_id])
    if @match
      @comment = @match.comments.create(comment_params)
      redirect_to @match
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
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
