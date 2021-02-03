class CreateBabies < ActiveRecord::Migration[4.2]
  def change
    create_table :babies do |t|
      t.string  :name
      t.string  :feeding_type
      t.datetime :start_time
      t.datetime :end_time
      t.decimal  :total_amount, precision: 6, scale: 2
      t.integer  :user_id
    end
  end
end
