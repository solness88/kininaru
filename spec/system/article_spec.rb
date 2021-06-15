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
    describe '気になるニュース登録・削除' do
      before do
        user = FactoryBot.create(:user)
        admin_user = FactoryBot.create(:admin_user)
        FactoryBot.create(:article, user: admin_user)
        visit new_session_path
        fill_in 'Email', with: 'admin-guest@admin-guest.com'
        fill_in 'Password', with:'123qwe'
        click_button 'Log in'
      end
      context '「気になるニュース」ボタンを押した場合' do
        it '当該ニュースが画面右に表示される' do
          visit articles_path
          click_on '気になる', match: :first
          expect(page).to have_content 'tokyo'
        end
      end
      context '「気になるニュース」の削除ボタンを押した場合' do
        it '削除メッセージが表示される' do
          visit articles_path
          find(".fa-trash-alt").click
          expect(page).to have_content '気になるニュースを削除しました'
        end
      end
    end


    describe 'ユーザーCRUD機能' do
      before do
        #user = FactoryBot.create(:user)
        admin_user = FactoryBot.create(:admin_user)
        admin_user2 = FactoryBot.create(:admin_user2)
        FactoryBot.create(:article, user: admin_user)
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
          find(".user_edit_btn").click
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
      context 'ユーザーを削除した場合' do
        before do
          visit admin_users_path
          find(".user_delete_btn").click
        end
        it 'ユーザー一覧に変更後のユーザー名が表示される' do
          expect(page).to have_content 'ユーザーを削除しました'
        end
      end
    end
    describe 'ログイン機能' do
      before do
        admin_user = FactoryBot.create(:admin_user)
        FactoryBot.create(:article, user: admin_user)
        visit new_session_path
      end
      context 'ログインに成功した場合' do
        it 'ユーザー一覧画面に遷移し「このチームのメンバー」の文字が表示される' do
          fill_in 'Email', with: 'admin-guest@admin-guest.com'
          fill_in 'Password', with:'123qwe'
          click_button 'Log in'
          expect(page).to have_content 'このチームのメンバー'
        end
      end
      context 'ログインに失敗した場合' do
        it 'ログインに失敗した旨のメッセージが表示される' do
          fill_in 'Email', with: 'admin-guest@admin-guest.com'
          fill_in 'Password', with:'111111'
          click_button 'Log in'
          expect(page).to have_content 'メールアドレスとパスワードをご確認ください。'
        end
      end
    end
    describe 'ログアウト機能' do
      before do
        admin_user = FactoryBot.create(:admin_user)
        FactoryBot.create(:article, user: admin_user)
        visit new_session_path
        fill_in 'Email', with: 'admin-guest@admin-guest.com'
        fill_in 'Password', with:'123qwe'
        click_button 'Log in'
      end
      context 'ログアウトした場合' do
        it 'ログイン画面に遷移する' do
          find(".logout").click
          expect(page).to have_content 'ログイン'
        end
      end
    end


    describe 'コメント機能' do
      before do
        admin_user = FactoryBot.create(:admin_user)
        FactoryBot.create(:article, user: admin_user)
        visit new_session_path
        fill_in 'Email', with: 'admin-guest@admin-guest.com'
        fill_in 'Password', with:'123qwe'
        click_button 'Log in'
        visit articles_path
      end
      context 'コメントを登録した場合' do
        it 'コメント内容が表示される' do
          find(".fa-comment").click
          find(".comment_btn").click
          fill_in 'comment_test', with: 'comment_testß'
          click_button '登録する'
          expect(page).to have_content 'comment_test'
        end
      end
    end

  end
end
