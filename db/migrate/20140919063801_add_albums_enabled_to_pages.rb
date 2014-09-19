class AddAlbumsEnabledToPages < ActiveRecord::Migration
  def change
    add_column :pages, :album_enabled, :boolean, :default => true
  end
end
