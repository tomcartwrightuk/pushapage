class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :password, :password_confirmation, :remember_me, :instapaper_user, :instapaper_pass, :pinboard_user, :pinboard_pass
  attr_accessor :updating_password
  has_many :site_references

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }, :if => :needs_email_or_pw?
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }, :if => :needs_email_or_pw?
  
  def needs_email_or_pw?
    updating_password || new_record?
  end
end
