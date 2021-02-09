class Baby < ActiveRecord::Base
    has_many :schedules
    has_many :users, through: :schedules
    validates :name, :age, :user_id, presence: true
  
end
