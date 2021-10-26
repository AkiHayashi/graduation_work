require 'rails_helper'

RSpec.describe 'User Registration', type: :system do
  describe 'User test' do

    before do
      @user = FactoryBot.create(:user)
      @account = FactoryBot.create(:account, user: @user)
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

    describe 'Create user' do
      context 'Registration to logout' do
        it 'User can create their account and logout' do
          all("a")[0].click # 新規登録btn
          sleep 0.2
          fill_in 'user[login_name]', with: 'テストユーザー２'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          fill_in 'user[account_attributes][name]', with: '健康 太郎'
          fill_in 'user[account_attributes][birth_date]', with: '0019300208'
          fill_in 'user[account_attributes][mail]', with: 'test@test.com'
          fill_in 'user[account_attributes][address]', with: '東京都墨田区押上１丁目１−２ 東京スカイツリータウン・ソラマチ 5-6F'
          fill_in 'user[account_attributes][tel]', with: '09000000000'
          sleep 0.3
          click_on "アカウント登録"
          expect(page).to have_content 'アカウント登録が完了しました。'

          click_on 'わたしのページ'
          expect(page).to have_content '健康 太郎'

          click_on 'ログアウト'
          expect(page).to have_content 'ログアウトしました。'
        end
      end
    end
    
    describe 'Login' do
      context 'User can login' do
        it 'User can see their information after login' do
          login
          expect(page).to have_content 'ログインしました。'
        end
      end
    end

    describe 'Edit User' do
      context 'User can edit their information' do
        it 'Information of the user will be changed' do
          login
          click_on 'わたしのページ'
          click_on 'プロフィール編集'
          fill_in 'user[account_attributes][address]', with: "東京都千代田区"
          fill_in 'user[current_password]', with: @user.password
          click_on '更新'
          expect(page).to have_content 'アカウント情報を変更しました。'
        end
      end
    end
    
    describe 'Destroy User' do
      context 'User can destroy their account' do
        it 'User does not exists anymore' do
          login
          click_on 'わたしのページ'
          click_on 'プロフィール編集'
          click_on 'アカウント削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。'
        end
      end
    end
  end
end