class User < ApplicationRecord
  validates_presence_of :username
  validates :uid, presence: true, uniqueness: true
  validates :google_token, presence: true, uniqueness: true

  def self.parse_omniauth(access_data)
    where(uid: access_data.info.uid).first_or_initialize do |user|
      user.username = access_data.info.email
      user.uid = access_data.uid
    end
  end
end
