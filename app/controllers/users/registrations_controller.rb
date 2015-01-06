class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up(resource_name, resource)
  end

  private
 
  def sign_up_params
    params.require(:user).permit(:fullname, :phone, :method, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:fullname, :phone, :method, :email, :password, :password_confirmation, :current_password)
  end
end