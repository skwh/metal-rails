class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.belongs_to :page

      t.timestamps
    end
  end
end
