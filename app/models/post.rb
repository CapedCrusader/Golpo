class Post < ActiveRecord::Base
  attr_accessible :title, :content, :photo
  belongs_to :user
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories
  has_attached_file :photo
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true 
  validates :user_id, presence: true
  
  default_scope order: 'posts.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end
end
