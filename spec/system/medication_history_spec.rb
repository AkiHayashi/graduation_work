require 'rails_helper'

RSpec.describe 'Medication History', type: :system do
  describe 'User test' do

    before do
      @user = FactoryBot.create(:user)
      @account = FactoryBot.create(:account, user: @user)
      @medication_history = FactoryBot.create(:medication_history, user: @user)
      @pharmacy = FactoryBot.create(:pharmacy, medication_history: @medication_history)
      visit root_path
      click_on "アプリを始める"
    end

    def login
      visit new_user_session_path
      fill_in "user[login_name]", with: @user.login_name
      fill_in "user[password]", with: @user.password
      all('input')[2].click #ログインボタンクリック
    end 
    # actoryBot.create(:account, name: '健康花子', birth_date: DateTime.now - 10_000, mail: 'test_user@test.com', address: '東京都墨田区押上', tel: '09011111111', allergy: 0, admin: false, user_id: @user.id)

    describe 'Create Medication History' do
      context 'Registration' do
        it 'User can create their Medication History' do
          login 
          click_on 'わたしのページ'
          click_on '服薬歴を見る'
          click_on '新しい服薬歴を作成する'
          fill_in 'medication_history[name]', with: 'test_medication'
          fill_in 'medication_history[pharmacies_attributes][0][name]', with: 'test_pharmacy'
          click_on '登録する'
          expect(page).to have_content '服薬歴を作成しました'
        end
      end
    end
    describe 'Edit' do
      context 'User can edit Medication History' do
        it 'Medication History information will be changed' do
          login 
          click_on 'わたしのページ'
          click_on '服薬歴を見る'
          click_on 'この服薬歴を編集する'
          fill_in 'medication_history[note]', with: '編集成功'
          click_on '更新する'
          expect(page).to have_content '服薬歴の情報を更新しました'
        end
      end
    end
    describe 'Destroy' do
      context 'User can destroy Medication History' do
        it 'The Medication History does not exists anymore' do
          login
          click_on 'わたしのページ'
          click_on '服薬歴を見る'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '服薬歴を一件削除しました'
          expect(page).not_to have_content 'medication1'
        end
      end
    end
    describe 'Edit Pharmacy' do
      context 'User can edit Pharmacy information' do
        it 'Pharmacy information will be changed' do
          login
          click_on 'わたしのページ'
          click_on '服薬歴を見る'
          click_on 'かかりつけ薬局'
          click_on 'この薬局の情報を編集する'
          fill_in 'pharmacy[address]', with:'富山県'
          click_on '更新する'
          expect(page).to have_content '富山県'
          expect(page).to have_content '薬局の情報を更新しました'
        end
      end
    end
    describe 'Destroy Pharmacy' do
      context 'User can destroy Pharmacy information' do
        it 'The Pharmacy does not exists anymore' do
          login
          click_on 'わたしのページ'
          click_on '服薬歴を見る'
          click_on 'かかりつけ薬局'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '薬局を一件削除しました'
        end
      end
    end
  end
end