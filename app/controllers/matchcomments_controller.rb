class MatchcommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
    puts "comment controller new action"
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
    if @match
      @comment = @match.comments.create(comment_params)
      puts "comment created for match!"
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
    @match= Match.find(params[:match_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
  end
  def destroy
    @match= Match.find(params[:match_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @match
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
