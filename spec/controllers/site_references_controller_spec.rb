require 'spec_helper'
include Devise::TestHelpers

describe SiteReferencesController do

 describe "POST create" do
        
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "fail" do
      
      before(:each) do
        @bad_ref = {}
      end
        
      it "should not create a new site reference" do
        lambda do
          post :create, :site_reference => @bad_ref  
        end.should_not change(SiteReference, :count)
      end
    end

    describe "success" do
      
      before(:each) do
        @ref = { :reference => "http://example.com" }
      end

      it "should create a new site reference" do
        lambda do
          post :create, @ref  
        end.should change(SiteReference, :count).by(1)
      end

      it "should redirect to the root path" do
        post :create, @ref  
        response.should redirect_to(root_path)
      end

      it "should have a flash success message" do
        post :create, @ref
        flash[:success].should =~ /Page successfully pushed/i
      end

      it "should create a link resource using Ajax" do
        lambda do
          xhr :post, :create, @ref
        end.should change(SiteReference, :count).by(1)
      end
    end
  end




  it "should have create a site reference given valid attributes" do
    
  end

  describe "access" do
    it "should deny access to create if not signed in" do
    end

    it "should deny access to destroy if not signed in" do
    end
  end

  describe "POST create" do
 
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
 
    it "should have create a reference when given correct attributes" do
    end
  end

end
