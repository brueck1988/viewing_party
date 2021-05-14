class User < ApplicationRecord
  has_secure_password

  has_many :friendships
  has_many :friends, through: :friendships

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password_digest, presence: true
end
