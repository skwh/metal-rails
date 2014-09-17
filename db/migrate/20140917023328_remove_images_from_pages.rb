class RemoveImagesFromPages < ActiveRecord::Migration
  def change
  	remove_column :pages, :images, :text
  end
end
