require 'spec_helper'

describe SiteReference do

  before(:each) do
    @user = Factory(:user)
    @site_ref = @user.site_references.build(:upload)
  end

  describe "site_ref associations" do
    it "should have a user" do
       @site_ref.should respond_to(:user)
    end
  end
end
