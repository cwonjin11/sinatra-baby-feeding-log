class User < ActiveRecord::Base
    has_many :schedules
    has_many :babies, through: :schedules
    
    validates :username, :email, presence: true
    has_secure_password 
    # Pry.start
end
