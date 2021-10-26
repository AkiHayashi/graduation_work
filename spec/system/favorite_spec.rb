require 'rails_helper'

RSpec.describe 'Favorite', type: :system do
  describe 'Favorite function' do

    before do
      @user = FactoryBot.create(:user)
      # user2 = FactoryBot.create(:user, login_name: "ユーザー２")
      @account = FactoryBot.create(:account, user: @user)
      # account2 = FactoryBot.create(:account, user: user2, mail: 'ex2@ex.com', name: 'ケンコウ・ボブ')
      @diary = FactoryBot.create(:diary, user: @user)
      diary2 = FactoryBot.create(:diary, user: @user, title:'favorite_test' )
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

    describe 'New Favorite' do
      context 'Create Favorite and Destroy Favorite ' do
        it 'The number of いいね will be changed' do
          login
          click_on '日記'
          sleep 0.3
          click_on 'みんなの日記を見る'
          expect(page).not_to have_content '♥1'
          find("#favorite_buttons_#{@diary.id}").click
          expect(page).to have_content '♥1'
          find("#favorite_buttons_#{@diary.id}").click
          expect(page).not_to have_content '♥1'
        end
      end
    end
    
    describe 'Favorite Diary index' do
      context 'User can see Favorite Diary index' do
        it 'Only Favorite Diaries will be shown' do
          login
          click_on '日記'
          click_on 'みんなの日記を見る'
          find("#favorite_buttons_#{@diary.id}").click
          click_on 'メニューに戻る'
          click_on 'お気に入りの日記一覧'
          expect(page).not_to have_content '♥0'
        end
      end
    end
  end
end