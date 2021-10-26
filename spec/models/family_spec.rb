require 'rails_helper'

require 'rails_helper'
describe 'Family', type: :model do
  describe 'Validation test' do
    let!(:user) { FactoryBot.create(:user) }

    context 'name will be nil' do
      it 'Fail to create Diary' do
        family = Family.new(name: '', user_id: user.id)
        expect(family).not_to be_valid
      end
    end
    context 'name presence' do
      it 'Success to create Diary' do
        family = Family.new(name: 'test', user_id: user.id)
        expect(family).to be_valid
      end
    end
    context 'name length will be over 50' do
      it 'Fail to create Diary' do
        a = 't'
        family = Family.new(name: a * 51 , user_id: user.id)
        expect(family).not_to be_valid
      end
    end
    context 'name length will be in 30' do
      it 'Success to create Diary' do
        a = 't'
        family = Family.new(name: a * 50 , user_id: user.id)
        expect(family).to be_valid
      end
    end
  end
end