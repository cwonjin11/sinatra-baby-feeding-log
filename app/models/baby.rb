class Baby < ActiveRecord::Base
    has_many :schedules
    has_many :users, through: :schedules
    
  
end
