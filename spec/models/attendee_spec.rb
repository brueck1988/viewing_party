require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should have_many :party}
  end
end