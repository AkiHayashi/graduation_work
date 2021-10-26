require 'rails_helper'

RSpec.describe 'Health Status', type: :system do
  describe 'Health Status input function' do

    before do
      @user = FactoryBot.create(:user)
      @account = FactoryBot.create(:account, user: @user)
      @health_status = FactoryBot.create(:health_status, user: @user)
      visit root_path
      click_on "アプリを始める"
    end

    def login
      visit new_user_session_path
      fill_in "user[login_name]", with: @user.login_name
      fill_in "user[password]", with: @user.password
      all('input')[2].click #ログインボタンクリック
    end 
    # FactoryBot.create(:account, name: '健康花子', birth_date: DateTime.now - 10_000, mail: 'test_user@test.com', address: '東京都墨田区押上', tel: '09011111111', allergy: 0, admin: false, user_id: @user.id)

    describe 'Register Health Status' do
      context 'Create new Health Status' do
        it 'User can create new Health Status' do
          login
          click_on '健康管理'
          sleep 0.3
          click_on '健康状態を記録する'
          click_on '登録する'
          expect(page).to have_content '健康状態を記録しました'
        end
      end
    end
    
    describe 'Edit Health Status' do
      context 'User edit Health Status' do
        it 'Health Status information will be changed' do
          login
          click_on '健康管理'
          sleep 0.2
          click_on '過去の健康記録を見る'
          click_on 'この記録を編集する'
          fill_in 'health_status[condition]', with: '編集成功'
          click_on '更新する'
          expect(page).to have_content '健康状態の内容を更新しました'
          expect(page).to have_content '編集成功'
        end
      end
    end

    describe 'Destroy Health Status' do
      context 'User can Health Status' do
        it 'The Health Status does not exists anymore' do
          login
          click_on '健康管理'
          click_on '過去の健康記録を見る'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '健康状態の記録を一件削除しました'
        end
      end
    end
  end
end