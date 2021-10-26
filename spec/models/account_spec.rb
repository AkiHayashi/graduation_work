require 'rails_helper'

require 'rails_helper'
describe 'Account', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'Validation test' do
    context 'name will be nil' do
      it 'Fail to create Account' do
        account = Account.new(name: "", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).not_to be_valid
      end
    end
    context 'name presence' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).to be_valid
      end
    end
    context 'name length will be over 50' do
      it 'Fail to create Account' do
        account = Account.new(name: "テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).not_to be_valid
      end
    end
    context 'name length will be in 50' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).to be_valid
      end
    end
    context 'birth_date will be nil' do
      it 'Fail to create Account' do
        account = Account.new(name: "テスト", birth_date: '', mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).not_to be_valid
      end
    end
    context 'birth_date presence' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).to be_valid
      end
    end
    context 'address will be nil' do
      it 'Fail to create Account' do
        account = Account.new(name: "テスト", birth_date: "DateTime.now - 10_000", mail: "ex@ex.com", address: "", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).not_to be_valid
      end
    end
    context 'address presence' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).to be_valid
      end
    end
    context 'allergy will be nil' do
      it 'Fail to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "", admin: false, user_id: user.id)
        expect(account).not_to be_valid
      end
    end
    context 'allergy presence' do
      it 'Success to create User' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).to be_valid
      end
    end
    context 'mail will be nil' do
      it 'Fail to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).not_to be_valid
      end
    end
    context 'mail presence' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).to be_valid
      end
    end
    context 'mail will be not permitted format' do
      it 'Fail to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account.mail).not_to match( /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
        expect(account).not_to be_valid
      end
    end
    context 'mail will be permitted format' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account.mail).to match( /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
      end
    end
    context 'mail length will be over 100' do
      it 'Fail to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "exexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexexex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).not_to be_valid
      end
    end
    context 'mail length will be in 100' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).to be_valid
      end
    end
    context 'tel will be nil' do
      it 'Fail to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "", address: "テスト", tel: "", allergy: "無し", admin: false, user_id: user.id)
        expect(account).not_to be_valid
      end
    end
    context 'tel presence' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).to be_valid
      end
    end
    context 'tel will be not permitted format' do
      it 'Fail to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "test", allergy: "無し", admin: false, user_id: user.id)
        expect(account.tel).not_to match(/\A[0-9０-９]+\z/)
        expect(account).not_to be_valid
      end
    end
    context 'tel will be permitted format' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account.tel).to match(/\A[0-9０-９]+\z/)
      end
    end
    context 'tel length will be over 11' do
      it 'Fail to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "00000000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).not_to be_valid
      end
    end
    context 'tel length will be in 11' do
      it 'Success to create Account' do
        account = Account.new(name: "テスト", birth_date: DateTime.now - 10_000, mail: "ex@ex.com", address: "テスト", tel: "0000000000", allergy: "無し", admin: false, user_id: user.id)
        expect(account).to be_valid
      end
    end
  end
end