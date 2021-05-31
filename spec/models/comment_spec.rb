require 'rails_helper'
RSpec.describe User, type: :model do
#コメント欄が空欄のまま投稿しようとするとエラーメッセージ
  describe 'バリデーション' do
    context 'コメント欄が空欄で投稿しようとした場合' do
      it "エラーメッセージを表示" do
        comment = Comment.new(
          content: '')
          comment.valid?
        expect(comment.errors.full_messages).to include("コメント内容を入力してください")
      end
    end
  end
end
