class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :amount_dollars
      t.datetime :place_at
      t.belongs_to :user, foreign_key: true
      t.integer :item_id, null: false
      t.integer :auction_id, null: false

      t.timestamps
    end
  end
end
