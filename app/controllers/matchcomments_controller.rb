class MatchcommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_match, only: [:create, :show, :edit, :update, :destroy, :new]
  def new
    puts "comment controller new action"
    @comment = Comment.new
  end
  def index
    @comments=Comment.all
  end
  def show
    @comment = Comment.find(params[:id])
  end
  def create
    @comment = @match.comments.create(comment_params)
    puts "comment created for match!"
    current_user.comments << @comment
    redirect_to @match
  end
  def edit
    @comment = Comment.find(params[:id])
    render :edit
  end
  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @match
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @match
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
