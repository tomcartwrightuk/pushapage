class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication
 
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        resource.reset_authentication_token!        
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render 'new' }
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    # If the user has filled in any of the password fields, we'll update their password
    any_passwords = %w(password password_confirmation current_password).any? do |field|
      params[resource_name][field].present?
    end
    update_method = any_passwords ? :update_with_password : :update_without_password

    if resource.send(update_method, params[resource_name])
      set_flash_message :notice, :updated if is_navigational_format?
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource){ render 'edit' }
    end
  end
end
