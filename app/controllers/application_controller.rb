class ApplicationController < ActionController::Base
  #before_action :authenticate_customer!, except: [:top, :about]
  #before_action :authenticate_admin!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  
  
  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path
    else
      customers_my_page_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  
  
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    
  end
end
