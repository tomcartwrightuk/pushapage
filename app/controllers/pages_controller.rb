class PagesController < ApplicationController
  def home
    if signed_in?
    @user = current_user
    @site_references = current_user.site_references.find(:all, :order => "id desc", :limit => 10).reverse
    end
  end

  def setup
    @resource = current_user
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
