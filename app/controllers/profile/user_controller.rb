class Profile::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :load_model, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @user.update user_params

      redirect_to profile_user_path @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def load_model
    @user = current_user
  end
end
