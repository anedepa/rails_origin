class ArticlesController < ApplicationController

before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
before_action :correct_user,   only: :destroy

  
  def index
    
    @articles = Article.paginate(page: params[:page],per_page: 5).order(created_at:'desc')
    
    
  end

  def index_per
    
    @page = params[:per]
    @articles = Article.paginate(page: params[:page],per_page: @page).order(created_at:'desc')
    render("index")
  end

  def show
    @article=Article.find(params[:id])
    
    #@comments = @article.comments.paginate(page: params[:page],per_page: 5).order(created_at:'desc')
    @comments = @article.comments.paginate(page: params[:page],per_page: 30).order(created_at:'desc')
  end

  def edit
    @article=Article.find(params[:id])
  end

   def destroy
Article.find(params[:id]).destroy
    #User.find(params[:id]).destroy
    flash[:success] = "投稿を削除しました"
    #redirect_to users_url
redirect_to user_path(current_user.id)
  end

  def update
    @article=Article.find(params[:id])


if @article.update_attributes(article_params)
     flash[:success] = "編集完了"
     redirect_to @article
   else
     render 'edit'
   end
   

  end

  def new
    @article = Article.new

  end


def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "投稿完了"
      redirect_to root_url
    else
      
render 'new'
     
    end
  end


private

	def img_name 
	 params[:img].original_filename
	end

    def article_params
      params.require(:article).permit(:title,:contents,:picture,:img_style,:color)
   end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to root_url if @article.nil?
      
      
    end
    def user_params     
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end



end