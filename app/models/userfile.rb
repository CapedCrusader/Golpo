class Userfile < ActiveRecord::Base
  attr_accessible :userfile, :userfile_content_type, :userfile_file_name, :userfile_file_size, :userfile_updated_at, :post_id
  belongs_to :post
  has_attached_file :userfile
end
