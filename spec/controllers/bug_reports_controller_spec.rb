require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BugReportsController do

  # This should return the minimal set of attributes required to create a valid
  # BugReport. As you add validations to BugReport, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all bug_reports as @bug_reports" do
      bug_report = BugReport.create! valid_attributes
      get :index
      assigns(:bug_reports).should eq([bug_report])
    end
  end

  describe "GET show" do
    it "assigns the requested bug_report as @bug_report" do
      bug_report = BugReport.create! valid_attributes
      get :show, :id => bug_report.id.to_s
      assigns(:bug_report).should eq(bug_report)
    end
  end

  describe "GET new" do
    it "assigns a new bug_report as @bug_report" do
      get :new
      assigns(:bug_report).should be_a_new(BugReport)
    end
  end

  describe "GET edit" do
    it "assigns the requested bug_report as @bug_report" do
      bug_report = BugReport.create! valid_attributes
      get :edit, :id => bug_report.id.to_s
      assigns(:bug_report).should eq(bug_report)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BugReport" do
        expect {
          post :create, :bug_report => valid_attributes
        }.to change(BugReport, :count).by(1)
      end

      it "assigns a newly created bug_report as @bug_report" do
        post :create, :bug_report => valid_attributes
        assigns(:bug_report).should be_a(BugReport)
        assigns(:bug_report).should be_persisted
      end

      it "redirects to the created bug_report" do
        post :create, :bug_report => valid_attributes
        response.should redirect_to(BugReport.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bug_report as @bug_report" do
        # Trigger the behavior that occurs when invalid params are submitted
        BugReport.any_instance.stub(:save).and_return(false)
        post :create, :bug_report => {}
        assigns(:bug_report).should be_a_new(BugReport)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BugReport.any_instance.stub(:save).and_return(false)
        post :create, :bug_report => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bug_report" do
        bug_report = BugReport.create! valid_attributes
        # Assuming there are no other bug_reports in the database, this
        # specifies that the BugReport created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BugReport.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => bug_report.id, :bug_report => {'these' => 'params'}
      end

      it "assigns the requested bug_report as @bug_report" do
        bug_report = BugReport.create! valid_attributes
        put :update, :id => bug_report.id, :bug_report => valid_attributes
        assigns(:bug_report).should eq(bug_report)
      end

      it "redirects to the bug_report" do
        bug_report = BugReport.create! valid_attributes
        put :update, :id => bug_report.id, :bug_report => valid_attributes
        response.should redirect_to(bug_report)
      end
    end

    describe "with invalid params" do
      it "assigns the bug_report as @bug_report" do
        bug_report = BugReport.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BugReport.any_instance.stub(:save).and_return(false)
        put :update, :id => bug_report.id.to_s, :bug_report => {}
        assigns(:bug_report).should eq(bug_report)
      end

      it "re-renders the 'edit' template" do
        bug_report = BugReport.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BugReport.any_instance.stub(:save).and_return(false)
        put :update, :id => bug_report.id.to_s, :bug_report => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bug_report" do
      bug_report = BugReport.create! valid_attributes
      expect {
        delete :destroy, :id => bug_report.id.to_s
      }.to change(BugReport, :count).by(-1)
    end

    it "redirects to the bug_reports list" do
      bug_report = BugReport.create! valid_attributes
      delete :destroy, :id => bug_report.id.to_s
      response.should redirect_to(bug_reports_url)
    end
  end

end
