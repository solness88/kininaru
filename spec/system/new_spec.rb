RSpec.describe 'ニュース保存機能', type: :system do
  describe 'APIの動作確認' do
    describe 'APIの動作確認' do
      context 'ルートページにアクセスした場合' do
        it 'FREE NEWS APIの記事がが表示される' do
          visit root_path
          expect(page).to have_css ".FREE_NEWS_article"
        end
      end
    end
    describe '気になるニュース登録の動作確認' do
      before do
        user = FactoryBot.create(:user)
        admin_user = FactoryBot.create(:admin_user)
        FactoryBot.create(:new, user: admin_user)
        visit new_session_path
        fill_in 'Email', with: 'admin-guest@admin-guest.com'
        fill_in 'Password', with:'123qwe'
        click_button 'Log in'
      end
      context '「気になるニュース」ボタンを押した場合' do
        it '当該ニュースが画面右に表示される' do
          visit news_index_path
          first('.button_kininaru').click
          expect '.kininaru_article_text'.to be_visible
        end
      end
      context '「気になるニュース」の削除ボタンを押した場合' do
        it '削除メッセージが表示される' do
          visit news_index_path
          find(".fa-trash-alt").click
          expect(page).to have_content '気になるニュースを削除しました'
        end
      end
    end
    describe 'ユーザーCRUD機能' do
      before do
        #user = FactoryBot.create(:user)
        admin_user = FactoryBot.create(:admin_user)
        FactoryBot.create(:new, user: admin_user)
        visit new_session_path
        fill_in 'Email', with: 'admin-guest@admin-guest.com'
        fill_in 'Password', with:'123qwe'
        click_button 'Log in'
      end
      context 'ユーザー登録画面に名前、メール、パスワード、確認用パスワードを入力後「ユーザーを追加」ボタンを押した場合' do
        it 'ユーザー一覧に登録した名前が表示される' do
          visit new_admin_user_path
          fill_in 'Name', with: 'admin'
          fill_in 'Email', with: 'admin-guest@admin-guest.com'
          fill_in 'Password', with:'123qwe'
          fill_in 'password_confirmation', with:'123qwe'
          click_button 'ユーザーを追加する'
          expect(page).to have_content 'admin'
        end
      end
      context 'ユーザー名を変更した場合' do
        before do
          visit admin_users_path
          find(".btn-primary").click
        end
        it 'ユーザー一覧に変更後のユーザー名が表示される' do
          fill_in 'Name', with: 'admin_test'
          fill_in 'Email', with: 'admin-guest@admin-guest.com'
          fill_in 'Password', with:'123qwe'
          fill_in 'password_confirmation', with:'123qwe'
          click_button 'ユーザーを追加する'
          expect(page).to have_content 'admin_test'
        end
      end
    end

  end
end
