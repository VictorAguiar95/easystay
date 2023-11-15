class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def check_proprietario
      redirect_to root_path, alert: 'Acesso restrito a proprietários' unless current_user.proprietario?
    end
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    end
end
