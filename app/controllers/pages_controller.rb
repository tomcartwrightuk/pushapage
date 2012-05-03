class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:home]  

  def home
    if signed_in?
    @user = current_user
    @site_references = current_user.site_references.find(:all, :order => "updated_at desc", :limit => 10)
    end
  end

  def setup
    @resource = current_user
  end

  def mobile_setup
    @user = current_user
  end
  
  def mobile_pullapage
    @user = current_user
  end

  def mobile_pushapage_history
    @user = current_user
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
