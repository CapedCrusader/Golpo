class Like < ActiveRecord::Base
  #attr_accessible :title, :body
  attr_accessible :post_id, :user_id
  belongs_to :user
  belongs_to :post
end
