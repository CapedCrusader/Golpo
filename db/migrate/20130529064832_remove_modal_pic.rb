class RemoveModalPic < ActiveRecord::Migration
  def change
  	remove_column :posts, :modalone_file_name
    remove_column :posts, :modalone_content_type
    remove_column :posts, :modalone_file_size
    remove_column :posts, :modalone_updated_at
  end
end
