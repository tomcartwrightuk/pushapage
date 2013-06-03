FactoryGirl.define do 
  factory :user do |user|
    user.email                	"user@exampleemail.com"
    user.password             	"foobar"
    user.password_confirmation	"foobar"
  end
end
