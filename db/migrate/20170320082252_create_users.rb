class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile_phone_number
      t.string :email_address
      t.string :physical_address

      t.timestamps
    end
    add_index :users, :email_address, unique: true 
    add_index :users, :mobile_phone_number, unique: true 
  end
end
