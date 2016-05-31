class MatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  def new
    @match=Match.new
    @courses=Course.all
  end

  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def create
    @match = Match.new(match_params)
    current_user.matches << @match
    if @match.save
      render :show, status: :created, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
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
      params.require(:match).permit(:timeanddate, :title, :course_id)
    end
end
