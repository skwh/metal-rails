class ChangePageTextDefault < ActiveRecord::Migration
  def change
  	change_column :pages, :input_text, :text, :default => ""
  	change_column :pages, :rendered_text, :text, :default => ""
  end
end
