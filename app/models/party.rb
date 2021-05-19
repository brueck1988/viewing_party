class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees

  validates :movie_title,
            :length,
            :date,
            :time,
            :runtime,
            :movie_id,
            presence: true

  validates :length, numericality: { greater_than_or_equal_to: :runtime }
  validates :runtime, numericality: true
end
