require "spec_helper"

describe BugReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/bug_reports").should route_to("bug_reports#index")
    end

    it "routes to #new" do
      get("/bug_reports/new").should route_to("bug_reports#new")
    end

    it "routes to #show" do
      get("/bug_reports/1").should route_to("bug_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bug_reports/1/edit").should route_to("bug_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bug_reports").should route_to("bug_reports#create")
    end

    it "routes to #update" do
      put("/bug_reports/1").should route_to("bug_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bug_reports/1").should route_to("bug_reports#destroy", :id => "1")
    end

  end
end
