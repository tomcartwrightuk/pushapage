module ApplicationHelper

    #def from_bookmark?
      #if stored_location_for(resource)[0..8] == '/add_site'
       #render :action => "new_from_bookmark"
      #else  
        #return
      #end
    #end
  def render_with_scope_toms(action, path=self.controller_path)
    if self.class.scoped_views?
      begin
        render :template => "#{devise_mapping.scoped_path}/#{path.split("/").last}/#{action}"
      rescue ActionView::MissingTemplate
        render :template => "#{path}/#{action}"
      end
    else
      render :template => "#{path}/#{action}"
    end
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

end
