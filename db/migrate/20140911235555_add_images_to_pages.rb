class AddImagesToPages < ActiveRecord::Migration
  def change
    add_column :pages, :images, :text, :default => ""
  end
end
