require 'rails_helper'

require 'rails_helper'
describe 'Diary', type: :model do
  describe 'Validation test' do
    let!(:user) { FactoryBot.create(:user) }

    context 'title will be nil' do
      it 'Fail to create Diary' do
        diary = Diary.new(title: '', content: 'test_content', user_id: user.id)
        expect(diary).not_to be_valid
      end
    end
    context 'title presence' do
      it 'Success to create Diary' do
        diary = Diary.new(title: 'test', content: 'test_content', user_id: user.id)
        expect(diary).to be_valid
      end
    end
    context 'title length will be over 30' do
      it 'Fail to create Diary' do
        diary = Diary.new(title: '12345678912345678912345678911123456789', content: 'test_content', user_id: user.id)
        expect(diary).not_to be_valid
      end
    end
    context 'title length will be in 30' do
      it 'Success to create Diary' do
        diary = Diary.new(title: 'test', content: 'test_content', user_id: user.id)
        expect(diary).to be_valid
      end
    end
    context 'content will be nil' do
      it 'Fail to create Diary' do
        diary = Diary.new(title: 'test', content: '', user_id: user.id)
        expect(diary).not_to be_valid
      end
    end
    context 'content presence' do
      it 'Success to create Diary' do
        diary = Diary.new(title: 'test', content: 'test_content', user_id: user.id)
        expect(diary).to be_valid
      end
    end
    context 'content length will be over 4000' do
      it 'Fail to create Diary' do
        a = 't'
        diary = Diary.new(title: 'test', content: a * 4001, user_id: user.id)
        expect(diary).not_to be_valid
      end
    end
    context 'content length will be in 4000' do
      it 'Success to create Diary' do
        a = 't'
        diary = Diary.new(title: 'test', content: a * 4000, user_id: user.id)
        expect(diary).to be_valid
      end
    end
    
  end
end