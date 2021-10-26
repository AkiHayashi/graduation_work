require 'rails_helper'

require 'rails_helper'
describe 'User', type: :model do
  describe 'Validation test' do
    context 'login_name will be nil' do
      it 'Fail to create User' do
        user = User.new(login_name: '', password: '111111')
        expect(user).not_to be_valid
      end
    end
    context 'login_name presence' do
      it 'Success to create User' do
        user = User.new(login_name: 'テスト', password: '111111')
        expect(user).to be_valid
      end
    end
    context 'login_name length will be over 50' do
      it 'Fail to create User' do
        user = User.new(login_name: 'テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト', password: '111111')
        expect(user).not_to be_valid
      end
    end
    context 'login_name length will be 1' do
      it 'Fail to create User' do
        user = User.new(login_name: 'テ', password: '111111')
        expect(user).not_to be_valid
      end
    end
    context 'login_name length will be in 2..50' do
      it 'Success to create User' do
        user = User.new(login_name: 'テスト', password: '111111')
        expect(user).to be_valid
      end
    end
    context 'login_name will be not permitted format' do
      it 'Fail to create User' do
        user = User.new(login_name: 'test', password: '111111')
        expect(user).not_to be_valid
      end
    end
    context 'login_name will be permitted format' do
      let(:user) { FactoryBot.create(:user) } 
      it 'Success to create User' do
        expect(user.login_name).to match(/\A[ぁ-んァ-ン一-龥々]/)
      end
    end
  end
end