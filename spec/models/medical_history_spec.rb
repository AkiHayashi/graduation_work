require 'rails_helper'

require 'rails_helper'
describe 'MedicalHistory', type: :model do
  describe 'Validation test' do
    let!(:user) { FactoryBot.create(:user) }

    context 'name will be nil' do
      it 'Fail to create Medical History' do
        medical_history = MedicalHistory.new(
          name: '', 
          start_on:  DateTime.now - 1, 
          surgery: "test_surgery", 
          surgery_on:  DateTime.now + 1,
          user_id: user.id
        )
        expect(medical_history).not_to be_valid
      end
    end
    context 'systolic presence' do
      it 'Success to create Medical History' do
        medical_history = MedicalHistory.new(
          name: 'test', 
          start_on:  DateTime.now - 1, 
          surgery: 'test_surgery', 
          surgery_on:  DateTime.now + 1,
          user_id: user.id
        )
        expect(medical_history).to be_valid
      end
    end
    context 'name length will be greater than 50' do
      it 'Fail to create Medical History' do
        a = 't'
        medical_history = MedicalHistory.new(
          name: a * 51, 
          start_on:  DateTime.now - 1, 
          surgery: "test_surgery", 
          surgery_on:  DateTime.now + 1,
          user_id: user.id
        )
        expect(medical_history).not_to be_valid
      end
    end
    context 'name length will be in 50' do
      it 'Success to create Medical History' do
        a = 't'
        medical_history = MedicalHistory.new(
          name: a * 50, 
          start_on:  DateTime.now - 1, 
          surgery: 'test_surgery', 
          surgery_on:  DateTime.now + 1,
          user_id: user.id
        )
        expect(medical_history).to be_valid
      end
    end
    context 'start_on will be nil' do
      it 'Fail to create Medical History' do
        medical_history = MedicalHistory.new(
          name: 'test', 
          start_on: '', 
          surgery: 'test_surgery', 
          surgery_on:  DateTime.now + 1,
          user_id: user.id
        )
        expect(medical_history).not_to be_valid
      end
    end
    context 'start_on presence' do
      it 'Success to create Medical History' do
        medical_history = MedicalHistory.new(
          name: 'test', 
          start_on:  DateTime.now - 1,
          surgery: 'test_surgery', 
          surgery_on:  DateTime.now + 1,
          user_id: user.id
        )
        expect(medical_history).to be_valid
      end
    end
  end
end