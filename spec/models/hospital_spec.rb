require 'rails_helper'

require 'rails_helper'
describe 'Hospital', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:medical_history) { FactoryBot.create(:medical_history, user: user) }

  describe 'Validation test' do
    context 'name will be nil' do
      it 'Fail to create Hospital' do
        hospital = Hospital.new(
          name: '', 
          address: 'test_address', 
          tel: '0000000000', 
          medical_history_id: medical_history.id
        )
        expect(hospital).not_to be_valid
      end
    end
    context 'name presence' do
      it 'Success to create Hospital' do
        hospital = Hospital.new(
          name: 'test', 
          address: 'test_address', 
          tel: '0000000000', 
          medical_history_id: medical_history.id
        )
        expect(hospital).to be_valid
      end
    end
    context 'name length will be over 50' do
      it 'Fail to create Hospital' do
        a = 't'
        hospital = Hospital.new(
          name: a * 51, 
          address: 'test_address', 
          tel: '0000000000', 
          medical_history_id: medical_history.id
        )
        expect(hospital).not_to be_valid
      end
    end
    context 'name length will be in 50' do
      it 'Success to create Hospital' do
        a = 't'
        hospital = Hospital.new(
          name: a * 50, 
          address: 'test_address', 
          tel: '0000000000', 
          medical_history_id: medical_history.id
        )
        expect(hospital).to be_valid
      end
    end
    context 'tel will be not permitted format' do
      it 'Fail to create Hospital' do
        hospital = Hospital.new(
          name: 'test', 
          address: 'test_address', 
          tel: 'test', 
          medical_history_id: medical_history.id
        )
        expect(hospital.tel).not_to match(/\A[0-9０-９]+\z/)
        expect(hospital).not_to be_valid
      end
    end
    context 'tel will be permitted format' do
      it 'Success to create Hospital' do
        hospital = Hospital.new(
          name: 'test', 
          address: 'test_address', 
          tel: '0000000000', 
          medical_history_id: medical_history.id
        )
        expect(hospital.tel).to match(/\A[0-9０-９]+\z/)
      end
    end
    context 'tel length will be over 11' do
      it 'Fail to create Hospital' do
        hospital = Hospital.new(
          name: 'test', 
          address: 'test_address', 
          tel: '123456789000', 
          medical_history_id: medical_history.id
        )
        expect(hospital).not_to be_valid
      end
    end
    context 'tel length will be in 11' do
      it 'Success to create Hospital' do
        hospital = Hospital.new(
          name: 'test', 
          address: 'test_address', 
          tel: '12345678900', 
          medical_history_id: medical_history.id
        )
        expect(hospital).to be_valid
      end
    end
  end
end