class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
    t.string  :feeding_type
    t.datetime :start_time
    t.datetime :end_time
    t.decimal  :total_amount, precision: 6, scale: 2
    t.integer  :user_id
    t.integer  :baby_id
    end
  end
end
