class AddColumnToBabies< ActiveRecord::Migration[5.2]
  def change
    add_column :babies, :user_id, :integer
    end
end