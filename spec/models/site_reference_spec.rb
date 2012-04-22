require 'spec_helper'

describe SiteReference do

  before(:each) do
    @user = Factory(:user)
    @url = { :reference => "www.example.com" }
  end
  
  describe "validations" do
    it "should create a new instance given valid attributes" do
      @user.site_references.create!(@url)
    end

    it "should require a non-blank reference" do
        @user.site_references.build(@url.merge(:reference => '')).should_not be_valid
    end
    
    it "should require a user" do
      SiteReference.new(@url).should_not be_valid
    end
  end

  describe "site_ref associations" do
    
    before(:each) do
      @site_ref = @user.site_references.build(:upload)
    end

    it "should have a user" do
       @site_ref.should respond_to(:user)
    end

    it "should respond to the correct user" do
      @site_ref.user.should == @user  
    end
  end

end
