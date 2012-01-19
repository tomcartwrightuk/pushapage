class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def render_with_scope_bookmark(action, path=self.controller_path)
    if self.class.scoped_views?
      begin
        render :template => "#{devise_mapping.scoped_path}/#{path.split("/").last}/#{action}", :layout => 'bookmark_layout'
      rescue ActionView::MissingTemplate
        render :template => "#{path}/#{action}", :layout => 'bookmark_layout'
      end
    else
      render :template => "#{path}/#{action}", :layout => 'bookmark_layout'
    end
  end

  #def after_sign_in_path_for(resource)
        #stored_location_for(resource) || signed_in_root_path(resource)
      #end
      #def stored_location_for(resource_or_scope)
        #scope = Devise::Mapping.find_scope!(resource_or_scope)
        #session.delete("#{scope}_return_to")
      #end
end
