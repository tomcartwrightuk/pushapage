require 'spec_helper'

describe User do

  describe "validations" do
    
  before(:each) do
      @attr = {
        :email => "user@example.com",
        :password => "foobar",
        :password_confirmation => "foobar"
      }
    end

    it "should require a password" do
      invalid_password_user = User.new(@attr.merge(:password => ""))
      invalid_password_user.should_not be_valid
    end

  end

end
