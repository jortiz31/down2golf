class MatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  def new
    @match=Match.new
    @courses=Course.all
  end

  def index
    @match= Match.new
    @courses = Course.all
    @matches = Match.all
  end

  def show
    @comment= Comment.new
    @match = Match.find(params[:id])
  end

  def create
    @match_count = 0
    current_user.matches.each do |match|
      if match.users.first == current_user
        @match_count += 1
      end
    end
    @comment = Comment.new
    if current_user.premium
      @match = Match.new(match_params)
      current_user.matches << @match
      redirect_to @match
    elsif @match_count >= 5
      flash[:notice]="Sign up for premium in order to create more than 5 matches!"
      redirect_to matches_path
    elsif @match_count < 5
      @match=Match.new(match_params)
      current_user.matches << @match
      redirect_to @match
    end
  end

  def edit
    @courses=Course.all
    render :edit
  end

  def update
    if @match.update(match_params)
      render :show, status: :ok, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  def join
    @match = Match.find params[:match_id]
    @match.users << current_user
    current_user.matches << @match
    redirect_to @match
  end

  def leave
    @match = Match.find params[:match_id]
    current_user.matches.destroy(@match)
    redirect_to @match
  end

  def destroy
    @match.destroy
    redirect_to matches_path
  end

  private
    def set_match
      @match = Match.find(params[:id])
    end

    def match_params
      params.require(:match).permit(:date, :time, :title, :course_id)
    end
end
