class CreateAuctionAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :auction_admins do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :auction, foreign_key: true, null: false

      t.timestamps
    end
  end
end
