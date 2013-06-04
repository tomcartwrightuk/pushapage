require 'spec_helper'

describe UsersController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
   
  describe "insta_check" do
    it "should respond using ajax if instapaper account present" do
        lambda do
          xhr :get, :insta_check
          response should be_true
        end
    end
  end

end
