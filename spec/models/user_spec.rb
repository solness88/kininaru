require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'バリデーション' do
      ##名前、メール、パスワード、パスワード確認が入力されていたら有効
      context 'name, email, passwprd, password_confirmationが入力されていた場合' do
        it "バリデーションが通る" do
          user = User.new(
            name: 'tokyo',
            email: 'tokyo@tokyo.com',
            password: '123qwe',
            password_confirmation: '123qwe')
          expect(user).to be_valid
        end
      end

      ##名前が入力されていなかったらエラーメッセージ
      context 'nameが空欄の場合' do
        it "エラーメッセージを表示" do
          user = User.new(
            name: '',
            email: 'tokyo@tokyo.com',
            password: '123qwe',
            password_confirmation: '123qwe')
            user.valid?
          expect(user.errors.full_messages).to include("名前を入力してください")
        end
      end
      ##メールが入力されていなかったらエラーメッセージ
      context 'emailが空欄の場合' do
        it "エラーメッセージを表示" do
          user = User.new(
            name: 'tokyo',
            email: '',
            password: '123qwe',
            password_confirmation: '123qwe')
            user.valid?
          expect(user.errors.full_messages).to include("メールアドレスを入力してください")
        end
      end
      ##パスワードが入力されていなかったらエラーメッセージ
      context 'passwprdが空欄の場合' do
        it "エラーメッセージを表示" do
          user = User.new(
            name: 'tokyo',
            email: 'tokyo@tokyo.com',
            password: '',
            password_confirmation: '123qwe')
            user.valid?
          expect(user.errors.full_messages).to include("パスワードを入力してください")
        end
      end

      ##確認用パスワードが入力されていなかったらエラーメッセージ
      context 'passwprd_confirmationが空欄の場合' do
        it "エラーメッセージを表示" do
          user = User.new(
            name: 'tokyo',
            email: 'tokyo@tokyo.com',
            password: '123qwe',
            password_confirmation: '')
            user.valid?
          expect(user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
        end
      end

      ##メールアドレスが重複していたらメッセージ
      context '入力したemailがすでに登録されていた場合' do
        before do
          FactoryBot.create(:user)
        end
        it "エラーメッセージを表示" do
           user1 = User.new(
            name: 'tokyo',
            email: 'tokyo@tokyo.com',
            password: '123qwe',
            password_confirmation: '123qwe')
            user1.valid?
          expect(user1.errors.full_messages).to include("メールアドレスはすでに存在します")
        end
      end



  end
end
