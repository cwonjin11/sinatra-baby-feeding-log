class User < ActiveRecord::Base
    has_many :schedules
    has_many :babies, through: :schedules
    
    validates_presence_of :username, :email, :password
    validates_uniqueness_of :username, :email
  
    has_secure_password 
    

end
