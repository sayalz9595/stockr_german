class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit( :email, :password, :password_confirmation, :description)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :description)
  end
end
