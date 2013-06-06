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
    @user = User.find(current_user.id)
    successfully_updated = if needs_password?(@user, params)
      @user.updating_password = true
      @user.update_with_password(params[:user])
    else
      params[:user].delete(:current_password)
      @user.updating_password = false
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  private

  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      !params[:user][:password].blank?
  end
  
end
