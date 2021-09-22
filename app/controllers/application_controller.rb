class ApplicationController < ActionController::Base
  before_action :authenticate_customer!,except: [:top,:about,:index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
      customers_path

  end

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name_kana,:last_name_kana,:email,:postal_code,:address,:phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
   end
end
