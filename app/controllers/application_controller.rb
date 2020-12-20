class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, key:[
      :email,
      :name,
      :postcode,
      :prefecture_name,
      :address_city,
      :address_street,
      :address_building
    ])
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end

end
