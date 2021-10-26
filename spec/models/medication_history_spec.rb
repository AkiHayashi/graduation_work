require 'rails_helper'

require 'rails_helper'
describe 'MedicationHistory', type: :model do
  describe 'Validation test' do
    let!(:user) { FactoryBot.create(:user) }

    context 'name will be nil' do
      it 'Fail to create Medication History' do
        medication_history = MedicationHistory.new(
          name: '', 
          usage: '内服', 
          prescription_on: DateTime.now, 
          note: 'test_note', 
          user_id: user.id
        )
        expect(medication_history).not_to be_valid
      end
    end
    context 'systolic presence' do
      it 'Success to create Medication History' do
        medication_history = MedicationHistory.new(
          name: 'test', 
          usage: '内服', 
          prescription_on: DateTime.now, 
          note: 'test_note', 
          user_id: user.id
        )
        expect(medication_history).to be_valid
      end
    end
    context 'name length will be greater than 50' do
      it 'Fail to create Medication History' do
        a = 't'
        medication_history = MedicationHistory.new(
          name: a * 51, 
          usage: '内服', 
          prescription_on: DateTime.now, 
          note: 'test_note', 
          user_id: user.id
        )
        expect(medication_history).not_to be_valid
      end
    end
    context 'name length will be in 50' do
      it 'Success to create Medication History' do
        a = 't'
        medication_history = MedicationHistory.new(
          name: a * 50, 
          usage: '内服', 
          prescription_on: DateTime.now, 
          note: 'test_note', 
          user_id: user.id
        )
        expect(medication_history).to be_valid
      end
    end
    context 'usage will be nil' do
      it 'Fail to create Medication History' do
        medication_history = MedicationHistory.new(
          name: 'test', 
          usage: '', 
          prescription_on: DateTime.now, 
          note: 'test_note', 
          user_id: user.id
        )
        expect(medication_history).not_to be_valid
      end
    end
    context 'usage presence' do
      it 'Success to create Medication History' do
        medication_history = MedicationHistory.new(
          name: 'test', 
          usage: '内服', 
          prescription_on: DateTime.now, 
          note: 'test_note', 
          user_id: user.id
        )
        expect(medication_history).to be_valid
      end
    end
    context 'prescription_on will be nil' do
      it 'Fail to create Medication History' do
        medication_history = MedicationHistory.new(
          name: 'test', 
          usage: '内服', 
          prescription_on: '', 
          note: 'test_note', 
          user_id: user.id
        )
        expect(medication_history).not_to be_valid
      end
    end
    context 'prescription_on presence' do
      it 'Success to create Medication History' do
        medication_history = MedicationHistory.new(
          name: 'test', 
          usage: '内服', 
          prescription_on: DateTime.now, 
          note: 'test_note', 
          user_id: user.id
        )
        expect(medication_history).to be_valid
      end
    end
  end
end