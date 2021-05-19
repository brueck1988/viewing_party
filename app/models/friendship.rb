class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, uniqueness: { scope: :friend_id }
  validate :disallow_self_referential_friendship

  def disallow_self_referential_friendship
    if friend_id == user_id
      errors.add(:user_id, 'You cannot add yourself as a friend')
    end
  end
end
