class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    user_judgement(@user)
    @profile = @user.profile
    @articles = @user.articles
    @current_user = current_user
    @following_count = @user.followings.count
    @followers_count = @user.followers.count
  end

  private
  def user_judgement(user)
    if @user == current_user
      redirect_to profile_path
    else
      user = @user
    end
  end

end
