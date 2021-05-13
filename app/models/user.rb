class User < ApplicationRecord
  has_secure_password

  has_many :friends, class_name: "User",
                     foreign_key: ""

  # has_many :friends, :foreign_key => "requested_id",
  #                    :class_name  => "Friendship",
  #                    :dependent   => :destroy
  # has_many :friends, :foreign_key => "accepted_id",
  #                    :class_name  => "Friendship",
  #                    :dependent   => :destroy


  # has_many :requested, foreign_key: :accepted, class_name: "Friendship"
  # has_many :accepted, foreign_key: :requested, class_name: "Friendship"

  # has_many :friendships
  # has_many :accepted_ids, through: :friendships
  # has_many :requested_ids, through: :friendships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
