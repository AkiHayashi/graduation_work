require 'rails_helper'

RSpec.describe 'Medical History', type: :system do
  describe 'User test' do

    before do
      @user = FactoryBot.create(:user)
      @account = FactoryBot.create(:account, user: @user)
      @medical_history = FactoryBot.create(:medical_history, user: @user)
      @hospital = FactoryBot.create(:hospital, medical_history: @medical_history)
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

    describe 'Create Medical History' do
      context 'Registration' do
        it 'User can create their Medical History' do
          login 
          click_on 'わたしのページ'
          click_on '既往歴を見る'
          click_on '新しい既往歴を作成する'
          fill_in 'medical_history[name]', with: 'test_disease'
          # fill_in 'medical_history[hospitals_attributes][0][name]', with: 'test_hospital'
          # click_on '病院を追加しない'
          click_on '登録する'
          expect(page).to have_content '既往歴が作成されました。'
        end
      end
    end
    describe 'Edit' do
      context 'User can edit Medical History' do
        it 'Medical History information will be changed' do
          login 
          click_on 'わたしのページ'
          click_on '既往歴を見る'
          click_on 'この既往歴を編集する'
          fill_in 'medical_history[name]', with: 'test_disease'
          fill_in 'medical_history_hospitals_attributes_0_tel', with: '0000000000'
          # binding.irb
          # click_on '病院を追加しない'
          click_on '更新する'
          expect(page).to have_content '既往歴が更新されました。'
        end
      end
    end
    describe 'Destroy' do
      context 'User can destroy Medical History' do
        it 'The Medical History does not exists anymore' do
          login
          click_on 'わたしのページ'
          click_on '既往歴を見る'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '既往歴が削除されました。'
          expect(page).not_to have_content 'disease1'
        end
      end
    end
    describe 'Edit Hospital' do
      context 'User can edit Hospital information' do
        it 'Hospital information will be changed' do
          login
          click_on 'わたしのページ'
          click_on '既往歴を見る'
          click_on 'かかりつけ医一覧を見る'
          click_on 'この病院の情報を編集する'
          fill_in 'hospital[address]', with:'富山県'
          click_on '更新する'
          expect(page).to have_content '富山県'
          expect(page).to have_content '病院の情報を更新しました'
        end
      end
    end
    describe 'Destroy Hospital' do
      context 'User can destroy Hospital information' do
        it 'The Hospital does not exists anymore' do
          login
          click_on 'わたしのページ'
          click_on '既往歴を見る'
          click_on 'かかりつけ医'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '病院を削除しました'
        end
      end
    end
  end
end