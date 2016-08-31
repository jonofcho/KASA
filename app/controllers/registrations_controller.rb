class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  def after_sign_up_path_for(resource)
    chongdae_path
  end
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :dob, :email, :password, :grad_year, :major, :current_employer, :current_position, :avatar) }
    end
end
