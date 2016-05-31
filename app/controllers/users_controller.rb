class UsersController < ApplicationController
  def index
      @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end
  def show
    @user = User.find(params[:id])
    @matches = @user.matches
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
    params.require(:user).permit(:username, :email, :password, :gravatar)
  end
end
