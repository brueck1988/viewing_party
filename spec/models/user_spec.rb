require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :uid }
    it { should validate_uniqueness_of :uid }
    it { should validate_uniqueness_of :google_token }
  end

  describe 'class methods' do
    describe 'User.parse_omniauth' do
      it 'finds a user in the database' do
        # binding.pry
        # user = create(:user, uid: '100000000000000000000', username: 'john@example.com')
        #
        # result = User.parse_omniauth()
        # expect(result.id).to eq(user.id)
      end
      it 'creates a new user in the database' do
        # user = create(:user, uid: '12345', username: 'something-new@gmail.com')
        #
        # result = User.parse_omniauth(@access_data)
        # expect(result.id).to eq(user.id)
        # expect(result.username).to eq(@access_data[:info][:email])
      end
    end
  end
end