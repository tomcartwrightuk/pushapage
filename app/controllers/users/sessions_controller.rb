class Users::SessionsController < Devise::SessionsController

  layout "application"

  def signin_from_website
    redirect_to :new
  end

  def new
    if user_signed_in?
      redirect_to root_path
    end
    resource = build_resource
    clean_up_passwords(resource)
    @location = session[:user_return_to] || 'empty'
    if @location == nil
      respond_with_navigational(resource){ render 'new' }
    elsif @location[0..8] == '/bookmark' || @location == '/site_re'
      respond_with_navigational(resource){ render_with_scope_bookmark :new }
    else
      respond_with_navigational(resource){ render 'new' }
    end
  end

    # POST /resource/sign_in
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
    #'respond_with resource, redirect_to after_sign_in_path_for(resource)
    #redirect_to after_sign_in_path_for(resource)
  end

  def change_user
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    redirect_to root_path 
  end
      
end
