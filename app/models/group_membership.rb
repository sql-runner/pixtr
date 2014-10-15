class GroupMembership < ActiveRecord::Base
  belongs_to :group, dependent: :destroy
  belongs_to :user
  validates :user, uniqueness: { scope: :group }
end
