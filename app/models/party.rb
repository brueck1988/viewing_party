class Party < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendees
  has_many :users, through: :attendees

end
