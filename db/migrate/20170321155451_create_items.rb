class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.json :photo
      t.string :title
      t.integer :estimation
      t.integer :auction_id, null: false


      t.timestamps
    end
  end
end
