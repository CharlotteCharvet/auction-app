class RemovePhotoFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :photo, :json
  end
end
