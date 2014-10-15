class Comment < ActiveRecord::Base

  belongs_to :image
  belongs_to :user

  validate :content, presence: true
  
  scope :by_most_recent, -> { order(created_at: :desc) }

end
