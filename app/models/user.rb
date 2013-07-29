class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :email, :name, :password, :password_confirmation
  
  email_regex = /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i
 
  validates :name,  :presence   => true,
					:length     => { :maximum => 50 }
  validates :email, :presence   => true,
					:format     => { :with => email_regex },
					:uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
					   :confirmation => true,
					   :length => { :within => 6..40 }
end
