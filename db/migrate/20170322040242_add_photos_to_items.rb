class AddPhotosToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :photos, :json
  end
end
