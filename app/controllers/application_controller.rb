class ApplicationController < ActionController::Base
  #権限の設定
  before_action :authenticate_user!, except: [:top, :about]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  #フラッシュメッセージ
  #if article.save
  #redirect_to user_path, notice: "表示させたいメッセージ"
  #end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
