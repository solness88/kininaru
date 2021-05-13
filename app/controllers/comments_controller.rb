class CommentsController < ApplicationController

  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @new = New.find(params[:news_id])
    @comment = @new.comments.build(comment_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to news_index_path }
      else
        format.html { redirect_to news_index_path, notice: '投稿できませんでした...' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:new_id, :content)
  end

end
