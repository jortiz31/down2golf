class MatchcommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_match, only: [:create, :show, :edit, :update, :destroy, :new, :index]
  def new
    puts "match comment controller new action"
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
    @comment = @match.comments.create(comment_params)
    puts "comment created for match!"
    current_user.comments << @comment
    flash[:notice]="Comment successfully created!"
    redirect_to @match
  end
  def edit
    @match = Match.find(params[:match_id])
    @comment = Comment.find(params[:id])
    render 'comments/edit'
  end
  def update
    @match = Match.find(params[:match_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    flash[:notice]="Comment successfully updated!"
    redirect_to @match
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice]="Comment successfully deleted!"
    redirect_to @match
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
