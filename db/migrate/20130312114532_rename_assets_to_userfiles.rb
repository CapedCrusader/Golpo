class RenameAssetsToUserfiles < ActiveRecord::Migration
  def up
  	rename_table :assets, :userfiles
  end

  def down
  	rename_table :userfiles, :assets
  end
end
