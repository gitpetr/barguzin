class BlockingusersController < ApplicationController
  before_action :set_user

  def block
    if @user.update block: true
      flash[:success] = 'Пользователь заблокирован'
    else
      flash[:error] = 'Не удалось заблокировать пользователя'
    end
    redirect_to users_path
  end

  def unblock
    @user.update block: false
    flash[:success] = 'Пользователь разблокирован'
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find params[:id]
  end
end
