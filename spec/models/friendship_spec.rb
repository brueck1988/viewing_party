require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "validations" do
    it "enforces uniqueness" do
      user1 = User.create!(name: "timmay", email: "timmay@tom.com", password: "Timmay")
      user2 = User.create(name: "george", email: "george@appleseed.com", password: "21345" )
      expect(Friendship.create!(user: user1, friend: user2)).to validate_uniqueness_of(:user_id).scoped_to(:friend_id)
    end
  end

  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :friend}
  end
end
