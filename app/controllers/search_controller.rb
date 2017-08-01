class SearchController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    if @user
      redirect_to user_path(@user)
    else
      flash[:danger] = "Такого пользователя не существует"
      redirect_back(fallback_location: root_path)
    end
  end
end
