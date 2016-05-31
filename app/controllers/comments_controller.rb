class CommentsController < ApplicationController
  def new
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
    @comment = Comment.create(comment_params)
    @match.comments << @comment
    redirect_to match_path(@match)
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
