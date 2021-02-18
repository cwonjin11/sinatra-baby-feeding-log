class Schedule < ActiveRecord::Base
    belongs_to :user
    belongs_to :baby
    
    validates :feeding_type, :start_time, :end_time, :total_amount, presence: true
end
