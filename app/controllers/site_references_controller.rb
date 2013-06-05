class SiteReferencesController < ApplicationController
 before_filter :authenticate_user!, :except => [:bookmark]
 before_filter :authenticate_user!
 require 'open-uri'
 require 'net/http'

  # GET /site_references
  # GET /site_references.xml
  def index
    @site_references = current_user.site_references.all
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @site_references }
    end
  end

  # GET /site_references/1
  # GET /site_references/1.xml
  def show
    @site_reference = SiteReference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site_reference }
    end
  end

  # GET /site_references/new
  # GET /site_references/new.xml
  def new
    @site_reference = SiteReference.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site_reference }
    end
  end

  def latest
    latest_url = current_user.site_references.find(:all, :order => "updated_at asc", :limit => 10).last.reference if current_user.site_references.count > 0
    if latest_url
      redirect_to latest_url 
    else
      redirect_to root_path
    end
  end

  def bookmark
    @user = current_user
    render :layout => 'bookmark_layout'	
  end

  
  # GET /site_references/1/edit
  def edit
    @site_reference = SiteReference.find(params[:id])
  end

  # POST /site_references
  # POST /site_references.xml
  def create
    @site_reference = current_user.site_references.find_or_initialize_by_reference(params[:reference])
    @site_reference.reference = params[:reference]
    @site_reference.updated_at = Time.new
    params[:title] ? @site_reference.title = params[:title] : @site_reference.title = params[:reference]
    respond_to do |format|
      if @site_reference.save
        format.json  { render :json =>  @site_reference, :callback => params[:callback] }
        format.html { redirect_to root_path, :flash => { :success => "Page successfully pushed" }}
      else
        format.json { render :json => @site_reference.errors, :status => :unprocessable_entity }
        format.html { render :action => "new", :flash => { :error => "There was an error. Check the URL and try again." }}
      end
    end
  end

  # PUT /site_references/1
  # PUT /site_references/1.xml
  def update
    @site_reference = SiteReference.find(params[:id])

    respond_to do |format|
      if @site_reference.update_attributes(params[:site_reference])
        format.html { redirect_to(@site_reference, :notice => 'Site reference was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site_reference.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /site_references/1
  # DELETE /site_references/1.xml
  def destroy
    @site_reference = SiteReference.find(params[:id])
    @site_reference.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.xml  { head :ok }
    end
  end

  def pullapage_screen
    @site_references = current_user.site_references.find(:all, :order => "id asc", :limit => 10).reverse
    render :layout => 'bookmark_layout'
  end

  def to_instapaper
    url = 'http://www.instapaper.com/api/add'
    ref, title = params[:reference], params[:title]
    uri = URI(url)
    res = Net::HTTP.post_form(uri, "username" => current_user.instapaper_user, "password" => current_user.instapaper_pass, "url" => ref, "title" => title)
    @user = current_user
    respond_to do |format|
      format.js { render :json => res.body, :callback => params[:callback] }
    end
  end

end
