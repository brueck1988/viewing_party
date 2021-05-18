require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validations" do
    it {should validate_presence_of :movie_title}
    it {should validate_presence_of :length}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :runtime}
    it {should validate_presence_of :movie_id}
    
    it {should validate_numericality_of :length}
    it {should validate_numericality_of :runtime}
  end
  
  describe "relationships" do
    it {should belong_to :host}
    it {should have_many :attendees}
    it {should have_many :users}
  end
end
