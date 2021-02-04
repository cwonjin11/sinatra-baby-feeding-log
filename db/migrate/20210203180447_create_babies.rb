class CreateBabies < ActiveRecord::Migration[5.2]
  def change
    create_table :babies do |t|
      t.string  :name
      t.integer :age 
    end
  end
end
