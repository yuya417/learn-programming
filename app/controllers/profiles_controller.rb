class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @profile = current_user.profile
    @articles = @user.articles
    @following_count = @user.followings.count
    @followers_count = @user.followers.count
  end

  def edit
    @profile = current_user.prepare_profile
    @user = current_user
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィールを更新しました！'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:introduction, :image)
  end

end