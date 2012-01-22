class SiteReferencesController < ApplicationController
 before_filter :authenticate_user!

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
    latest_url = SiteReference.last.reference
    redirect_to latest_url 
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
    @site_reference = current_user.site_references.build(params[:site_reference])
    @site_reference.reference = params[:reference]
    if params[:title]
      @site_reference.title = params[:title]
    else
      @site_reference.title = params[:reference]
    end
    respond_to do |format|
      if @site_reference.save
        format.html { redirect_to(@site_reference, :notice => 'Site reference was successfully created.') }
        format.json  { render :json => @site_reference, :status => :created, :location => @site_reference }
      else
        format.html { render :action => "new" }
        format.json { render :json => @site_reference.errors, :status => :unprocessable_entity }
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

end
