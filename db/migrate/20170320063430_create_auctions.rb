class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :time_zone_id
      t.text :physical_address
      t.string :name
      t.datetime :donation_window_ends_at

      t.timestamps
    end
  end
end
