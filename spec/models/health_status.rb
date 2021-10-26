require 'rails_helper'

require 'rails_helper'
describe 'HealthStatus', type: :model do
  describe 'Validation test' do
    let!(:user) { FactoryBot.create(:user) }

    context 'systolic will be nil' do
      it 'Fail to create Health Status' do
        hs = HealthStatus.new(
          systolic: "", 
          diastolic: 80, 
          pulse: 85, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).not_to be_valid
      end
    end
    context 'systolic presence' do
      it 'Success to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 80, 
          pulse: 85, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).to be_valid
      end
    end
    context 'systolic length will be smaller than 50' do
      it 'Fail to create Health Status' do
        hs = HealthStatus.new(
          systolic: 49, 
          diastolic: 80, 
          pulse: 85, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).not_to be_valid
      end
    end
    context 'systolic length will be greater than 49' do
      it 'Success to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 50, 
          pulse: 85, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).to be_valid
      end
    end
    context 'diastolic will be nil' do
      it 'Fail to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: "", 
          pulse: 85, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).not_to be_valid
      end
    end
    context 'diastolic presence' do
      it 'Success to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 80, 
          pulse: 85, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).to be_valid
      end
    end
    context 'diastolic length will be smaller than 50' do
      it 'Fail to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 49, 
          pulse: 85, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).not_to be_valid
      end
    end
    context 'diastolic length will be greater than 49' do
      it 'Success to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 50, 
          pulse: 85, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).to be_valid
      end
    end
    context 'pulse will be nil' do
      it 'Fail to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 80, 
          pulse: "", 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).not_to be_valid
      end
    end
    context 'pulse presence' do
      it 'Success to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 80, 
          pulse: 85, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).to be_valid
      end
    end
    context 'pulse length will be smaller than 50' do
      it 'Fail to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 80, 
          pulse: 49, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).not_to be_valid
      end
    end
    context 'pulse length will be greater than 49' do
      it 'Success to create Health Status' do
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 80, 
          pulse: 50, 
          condition: "test", 
          user_id: user.id
        )
        expect(hs).to be_valid
      end
    end
    context 'condition length will be over 200' do
      it 'Fail to create Health Status' do
        a = "t"
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 80, 
          pulse: 50, 
          condition: a * 201, 
          user_id: user.id
        )
        expect(hs).not_to be_valid
      end
    end
    context 'condition length will be in 200' do
      it 'Success to create Health Status' do
        a = "t"
        hs = HealthStatus.new(
          systolic: 100, 
          diastolic: 80, 
          pulse: 50, 
          condition: a * 200, 
          user_id: user.id
        )
        expect(hs).to be_valid
      end
    end
  end
end