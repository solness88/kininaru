class CommentsController < ApplicationController
  before_action :set_news, only: [:create, :edit, :update]

  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = @new.comments.build(comment_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to news_index_path, notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @comment = @new.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @new.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit_error }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:new_id, :content)
  end

  def set_news
    @new = New.find(params[:news_id])
  end

end
