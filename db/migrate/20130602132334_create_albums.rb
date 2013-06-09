class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :albumID
      t.string :image_thumb

      t.timestamps
    end
  end
end
