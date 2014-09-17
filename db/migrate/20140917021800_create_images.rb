class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.text :subtitle
      t.belongs_to :album

      t.timestamps
    end
  end
end
