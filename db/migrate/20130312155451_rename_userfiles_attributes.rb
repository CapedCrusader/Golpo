class RenameUserfilesAttributes < ActiveRecord::Migration
  def up
  	rename_column :userfiles, :asset_file_name, :userfile_file_name
    rename_column :userfiles, :asset_content_type, :userfile_content_type
    rename_column :userfiles, :asset_file_size, :userfile_file_size
    rename_column :userfiles, :asset_updated_at, :userfile_updated_at
  end

  def down
  	rename_column :userfiles, :userfile_file_name, :asset_file_name
    rename_column :userfiles, :userfile_content_type, :asset_content_type
    rename_column :userfiles, :userfile_file_size, :asset_file_size
    rename_column :userfiles, :userfile_updated_at, :asset_updated_at
  end
end
