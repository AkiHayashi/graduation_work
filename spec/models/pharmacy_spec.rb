require 'rails_helper'

require 'rails_helper'
describe 'Pharmacy', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:medication_history) { FactoryBot.create(:medication_history, user: user) }

  describe 'Validation test' do
    context 'name will be nil' do
      it 'Fail to create Hospital' do
        pharmacy = Pharmacy.new(
          name: '', 
          address: 'test_address', 
          tel: '0000000000', 
          medication_history_id: medication_history.id
        )
        expect(pharmacy).not_to be_valid
      end
    end
    context 'name presence' do
      it 'Success to create Hospital' do
        pharmacy = Pharmacy.new(
          name: 'test', 
          address: 'test_address', 
          tel: '0000000000', 
          medication_history_id: medication_history.id
        )
        expect(pharmacy).to be_valid
      end
    end
    context 'name length will be over 50' do
      it 'Fail to create Hospital' do
        a = 't'
        pharmacy = Pharmacy.new(
          name: a * 51, 
          address: 'test_address', 
          tel: '0000000000', 
          medication_history_id: medication_history.id
        )
        expect(pharmacy).not_to be_valid
      end
    end
    context 'name length will be in 50' do
      it 'Success to create Hospital' do
        a = 't'
        pharmacy = Pharmacy.new(
          name: a * 50, 
          address: 'test_address', 
          tel: '0000000000', 
          medication_history_id: medication_history.id
        )
        expect(pharmacy).to be_valid
      end
    end
    context 'tel will be not permitted format' do
      it 'Fail to create Hospital' do
        pharmacy = Pharmacy.new(
          name: 'test', 
          address: 'test_address', 
          tel: 'test', 
          medication_history_id: medication_history.id
        )
        expect(pharmacy.tel).not_to match(/\A[0-9０-９]+\z/)
        expect(pharmacy).not_to be_valid
      end
    end
    context 'tel will be permitted format' do
      it 'Success to create Hospital' do
        pharmacy = Pharmacy.new(
          name: 'test', 
          address: 'test_address', 
          tel: '0000000000', 
          medication_history_id: medication_history.id
        )
        expect(pharmacy.tel).to match(/\A[0-9０-９]+\z/)
      end
    end
    context 'tel length will be over 11' do
      it 'Fail to create Hospital' do
        pharmacy = Pharmacy.new(
          name: 'test', 
          address: 'test_address', 
          tel: '123456789000', 
          medication_history_id: medication_history.id
        )
        expect(pharmacy).not_to be_valid
      end
    end
    context 'tel length will be in 11' do
      it 'Success to create Hospital' do
        pharmacy = Pharmacy.new(
          name: 'test', 
          address: 'test_address', 
          tel: '12345678900', 
          medication_history_id: medication_history.id
        )
        expect(pharmacy).to be_valid
      end
    end
  end
end