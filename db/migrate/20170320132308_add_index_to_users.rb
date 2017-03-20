class AddIndexToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :mobile_phone_number, unique: true
  end
end
