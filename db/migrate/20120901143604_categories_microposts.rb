class CategoriesMicroposts < ActiveRecord::Migration
  def change
    create_table :categories_microposts, :id => false do |t|
      t.integer :category_id
      t.integer :micropost_id
    end
    add_index :categories_microposts, [:category_id, :micropost_id] 
  end
end
