require 'rails_helper'

RSpec.describe 'Diary', type: :system do
  describe 'Diary input function' do

    before do
      @user = FactoryBot.create(:user)
      @account = FactoryBot.create(:account, user: @user)
      @diary = FactoryBot.create(:diary, user: @user)
      user2 = FactoryBot.create(:user, login_name:'ユーザー')
      @diary2 = FactoryBot.create(:diary, title:'テスト', content:'テスト', user:user2 )
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

    describe 'New Diary' do
      context 'Create new Diary ' do
        it 'User can create new Diary ' do
          login
          click_on '日記'
          sleep 0.3
          click_on '日記を書く'
          fill_in 'diary[title]', with:'test'
          fill_in 'diary[content]', with:'test_content'
          click_on '登録する'
          expect(page).to have_content '日記を作成しました'
        end
      end
    end
    
    describe 'Edit Diary ' do
      context 'User edit Diary ' do
        it 'Diary  information will be changed' do
          login
          click_on '日記'
          click_on 'みんなの日記を見る'
          click_on '編集'
          fill_in 'diary[content]', with: '編集成功'
          click_on '更新する'
          expect(page).to have_content '日記の内容を更新しました'
          expect(page).to have_content '編集成功'
        end
      end
      context 'User cannot edit Diary of other user ' do
        it 'Diary  information will not be changed' do
          login
          visit "/diaries/#{@diary2.id}/edit"
          sleep 0.2
          expect(page).to have_content 'アクセス権限がありません'
        end
      end
    end
    
    describe 'See Diary detail ' do
      context 'User can see Diary detail ' do
        it 'Diary detail will be shown' do
          login
          click_on '日記'
          sleep 0.3
          click_on 'みんなの日記を見る'
          click_on 'この日記の内容を見る'
          expect(page).to have_content '内容'
          expect(page).to have_content 'test_diary_content'
        end
      end
    end
    
    describe 'Destroy Diary ' do
      context 'User can Diary ' do
        it 'The Diary  does not exists anymore' do
          login
          click_on '日記'
          click_on 'みんなの日記を見る'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '日記を削除しました'
        end
      end
    end
  end
end