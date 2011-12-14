class Users::SessionsController < Devise::SessionsController

  layout "application"

  def new
    resource = build_resource
    clean_up_passwords(resource)
    #@location = session[:user_return_to]
    #if after_sign_in_path_for(resource) == '/'
    if session[:user_return_to] == nil
      respond_with_navigational(resource, stub_options(resource)){ render_with_scope :new }
    elsif (session[:user_return_to])[0..8] == '/add_site'
      respond_with_navigational(resource, stub_options(resource)){ render_with_scope_bookmark :new }
    else
      respond_with_navigational(resource, stub_options(resource)){ render_with_scope :new }
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
    redirect_to '/sign_in'
  end
      
end
