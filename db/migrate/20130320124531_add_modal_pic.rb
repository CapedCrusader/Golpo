class AddModalPic < ActiveRecord::Migration
  def up
  	add_column :posts, :modalone_file_name, :string
    add_column :posts, :modalone_content_type, :string
    add_column :posts, :modalone_file_size, :integer
    add_column :posts, :modalone_updated_at, :datetime
  end

  def down
  	remove_column :posts, :modalone_file_name
    remove_column :posts, :modalone_content_type
    remove_column :posts, :modalone_file_size
    remove_column :posts, :modalone_updated_at
  end
end
