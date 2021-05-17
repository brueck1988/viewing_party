class Party < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendees
  has_many :users, through: :attendees

  validates :movie_title,
            :length,
            :date,
            :time,
            presence: true
end
