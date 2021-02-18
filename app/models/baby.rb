class Baby < ActiveRecord::Base
    has_many :schedules
    has_many :users, through: :schedules
    validates :name, :age,  presence: true
  #In order for the user to be redirected after signing up, their input needs to be validated so that bad data does not get saved into the data base
end
