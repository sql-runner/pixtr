class Image < ActiveRecord::Base
  has_many :comments
  belongs_to :gallery
  has_and_belongs_to_many :groups
  has_many :likes
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true

  acts_as_taggable

end
