class DropCategoriesMicroposts < ActiveRecord::Migration
  def change
  	drop_table :categories_microposts
  end
end
