class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :input_text
      t.text :rendered_text
      t.string :page_name

      t.timestamps
    end
  end
end
