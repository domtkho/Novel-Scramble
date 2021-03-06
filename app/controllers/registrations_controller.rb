class RegistrationsController < Devise::RegistrationsController

  def profile
    @user = User.find(params[:id])
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar)
  end

end