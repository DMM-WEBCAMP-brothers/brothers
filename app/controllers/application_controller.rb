class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	private

	def after_sign_in_path_for(resource)
		case resource
		when Member
			root_path
		when Admin
			admins_root_path
		end
	end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number])
    end

end
