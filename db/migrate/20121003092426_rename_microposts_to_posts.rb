class RenameMicropostsToPosts < ActiveRecord::Migration
  def up
    rename_table :microposts, :posts
  end

  def down
    rename_table :posts,:microposts
  end
end
