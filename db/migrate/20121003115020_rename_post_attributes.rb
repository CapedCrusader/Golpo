class RenamePostAttributes < ActiveRecord::Migration
  def up
    rename_column :posts, :content, :title
    rename_column :posts, :body, :content
  end

  def down
   rename_column :posts, :title, :content
   rename_column :posts, :content, :body
  end
end
