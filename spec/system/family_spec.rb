require 'rails_helper'

RSpec.describe 'Family', type: :system do
  describe 'Family connect function' do

    before do
      @user = FactoryBot.create(:user)
      @account = FactoryBot.create(:account, user: @user)
      user2 = FactoryBot.create(:user, login_name: "テストユーザー２")
      account2 = FactoryBot.create(:account, user: user2, mail: 'ex2@ex.com', name: 'ケンコウ・ボブ')
      @family = FactoryBot.create(:family)
      FactoryBot.create(:member, user: @user, family: @family)
      visit root_path
      click_on "アプリを始める"
    end

    def login
      visit new_user_session_path
      fill_in "user[login_name]", with: @user.login_name
      fill_in "user[password]", with: @user.password
      all('input')[2].click 
    end 
    # FactoryBot.create(:account, name: '健康花子', birth_date: DateTime.now - 10_000, mail: 'test_user@test.com', address: '東京都墨田区押上', tel: '09011111111', allergy: 0, admin: false, user_id: @user.id)

    describe 'New Family' do
      context 'Create new Family ' do
        it 'User can create new Family ' do
          login
          click_on '家族ページ'
          click_on '家族を追加する'
          fill_in 'family[name]', with:'test'
          click_on '登録する'
          expect(page).to have_content '新しい家族を追加しました'
        end
      end
    end
    
    describe 'See Family detail ' do
      context 'User can see Family detail ' do
        it 'Family detail will be shown' do
          login
          click_on '家族ページ'
          sleep 0.3
          click_on 'わたしの家族を見る'
          click_on 'この家族のページへ'
          expect(page).to have_content '健康花子'
        end
      end
    end

    describe 'Edit Family ' do
      context 'User edit Family ' do
        it 'Family  information will be changed' do
          login
          click_on '家族ページ'
          sleep 0.3
          click_on 'わたしの家族を見る'
          click_on 'この家族のページへ'
          click_on '編集'
          fill_in 'family[name]', with: '編集成功'
          click_on '更新する'
          expect(page).to have_content '家族の情報を更新しました'
          expect(page).to have_content '編集成功'
        end
      end
    end
  

    describe 'Invite Family Member' do
      context 'User can invite Family Member' do
        it 'New member will be shown' do
          login
          click_on '家族ページ'
          sleep 0.3
          click_on 'わたしの家族を見る'
          click_on 'この家族のページへ'
          find('input[type="text"]').set('ex2@ex.com')
          click_button
          expect(page).to have_content 'メンバーを追加しました'
          expect(page).to have_content 'ケンコウ・ボブ'
        end
      end
    end
    
    describe 'Destroy Family ' do
      context 'User can Family ' do
        it 'The Family  does not exists anymore' do
          login
          click_on '家族ページ'
          sleep 0.3
          click_on 'わたしの家族を見る'
          click_on 'この家族のページへ'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '家族を削除しました'
        end
      end
    end
  end
end