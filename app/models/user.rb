class User < ActiveRecord::Base
  has_many :comments
  has_many :group_memberships
  has_many :groups, through: :group_memberships
  has_many :images
  has_many :likes
  has_many :liked_images, through: :likes, source: :image

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

end
