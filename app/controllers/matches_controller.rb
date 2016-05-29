class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @matches = Match.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @match = Match.find(params[:id])
  end

  # POST /lists
  # POST /lists.json
  def create
    @match = Match.new(match_params)
    current_user.matches << @match
    @match.users << current_user
    if @match.save
      render :show, status: :created, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    @match.users << current_user
    current_user.matches<< @match
    if @match.update(match_params)
      render :show, status: :ok, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @match.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:timeanddate, :title, :user)
    end
end
