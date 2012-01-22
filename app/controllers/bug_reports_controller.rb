class BugReportsController < ApplicationController
  # GET /bug_reports
  # GET /bug_reports.xml
  def index
    @bug_reports = BugReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bug_reports }
    end
  end

  # GET /bug_reports/1
  # GET /bug_reports/1.xml
  def show
    @bug_report = BugReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bug_report }
    end
  end

  # GET /bug_reports/new
  # GET /bug_reports/new.xml
  def new
    @bug_report = BugReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bug_report }
    end
  end

  # GET /bug_reports/1/edit
  def edit
    @bug_report = BugReport.find(params[:id])
  end

  # POST /bug_reports
  # POST /bug_reports.xml
  def create
    @bug_report = BugReport.new(params[:bug_report])

    respond_to do |format|
      if @bug_report.save
        format.html { redirect_to(@bug_report, :notice => 'Bug report was successfully created.') }
        format.xml  { render :xml => @bug_report, :status => :created, :location => @bug_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bug_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bug_reports/1
  # PUT /bug_reports/1.xml
  def update
    @bug_report = BugReport.find(params[:id])

    respond_to do |format|
      if @bug_report.update_attributes(params[:bug_report])
        format.html { redirect_to(@bug_report, :notice => 'Bug report was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bug_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_reports/1
  # DELETE /bug_reports/1.xml
  def destroy
    @bug_report = BugReport.find(params[:id])
    @bug_report.destroy

    respond_to do |format|
      format.html { redirect_to(bug_reports_url) }
      format.xml  { head :ok }
    end
  end
end
