class Friendship < ApplicationRecord
  validates_uniqueness_of :user_id, :scope => :friend_id

  belongs_to :user
  belongs_to :friend, class_name: 'User'
  
  validate :disallow_self_referential_friendship
  
  def disallow_self_referential_friendship
    if friend_id == user_id
      errors.add(:user_id, 'You cannot add yourself as a friend')
    end
  end
end
