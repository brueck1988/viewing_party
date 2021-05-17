class User < ApplicationRecord
  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :hosted, class_name: "User"
  has_many :attendees
  has_many :parties, through: :attendees

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true
end
