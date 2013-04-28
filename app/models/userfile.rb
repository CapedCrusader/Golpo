class Userfile < ActiveRecord::Base
  attr_accessible :userfile, :userfile_content_type, :userfile_file_name, :userfile_file_size, :userfile_updated_at, :post_id
  belongs_to :post
  has_attached_file :userfile

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      files: [
                 {
                   name: userfile_file_name,
                   type: userfile_content_type,
                   size: userfile_file_size,
                   url: userfile.url,
                   delete_url: userfile_path(self),
                   delete_type: "DELETE" 
                 }
                ]
    }
  end

end
