class Admin::BlockingusersController < Admin::BaseController
  before_action :set_user

  def block
    @user.update block: true
    redirect_to admin_users_path, notice: 'Пользователь заблокирован', type: :success
  end

  def unblock
    @user.update block: false
    redirect_to admin_users_path, notice: 'Пользователь разблокирован', type: :success
  end

  private

  def set_user
    @user = User.find params[:id]
  end
end
