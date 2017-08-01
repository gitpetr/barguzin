class UsersController < ApplicationController

  before_action :load_model, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:email).paginate(:page => params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def load_model
    @user = User.find params[:id]
  end
end
