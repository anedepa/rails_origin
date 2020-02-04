class CommentsController < ApplicationController
 before_action :correct_user,   only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
   @user = User.find(session[:user_id])
   @article = Article.find(params[:article_id])
   @comment = @article.comments.find(params[:id])
   #if @user.id === @article.user.id
   @comment.destroy
   redirect_to article_path(@article)
   flash[:success] = "コメントを削除しました"
   #else
   #flash[:danger] = "権限がありません"
   #redirect_to article_path(@article)
   #end
  end

  private
    def comment_params
      params.require(:comment).permit(:body,:color)
    end

   def correct_user
    #この記事の投稿者のid
    @article = Article.find(params[:article_id])
    @user = User.find(@article.user.id)
    redirect_to(root_url) unless current_user?(@user)
    flash[:danger] = "権限がありません" unless current_user?(@user)
   end
end
