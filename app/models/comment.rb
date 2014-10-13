class Comment < ActiveRecord::Base

  belongs_to :image
  belongs_to :user

  scope :by_most_recent, -> { order(created_at: :desc) }

end
