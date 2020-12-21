class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys:[
      :email,
      :name,
      :postcode,
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building
    ])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end

end
