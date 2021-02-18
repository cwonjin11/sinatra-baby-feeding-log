class User < ActiveRecord::Base
    has_many :schedules
    has_many :babies, through: :schedules
    
    validates_presence_of :username, :email, :password
    #In order for the user to be redirected after signing up, their input needs to be validated so that bad data does not get saved into the data base
    has_secure_password 
    #Password Encryption
    #Password encryption was required to protect user accounts from getting hacked. It uses a hashing algorithm to scramble and salt passwords. In order to implement this we installed a gem called bcrypt and my User’s table had a password_digest column. I then added has_secure_password to my User model and now have all the functionalities of the bcrypt gem.

end
