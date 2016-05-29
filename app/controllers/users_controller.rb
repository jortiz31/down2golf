class UsersController < ApplicationController
  def new
  end
  def create
  end
  def show
    @user = User.find(params[:user_id])
    @matches = @user.matches
  end
  def edit
  end
  def update
  end
  def destroy
  end
  def join
    @match = Match.find params[:match_id]
    current_user.matches << @match
    redirect_to @match
  end

  def leave
    @match = Match.find params[:match_id]
    current_user.matches.destroy(@match)
    redirect_to @match
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
