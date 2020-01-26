class ArticlesController < ApplicationController

before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  # indexにアクセスした時articleのデータ全部をインスタンス変数に入れる
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
    
    @microposts = @article.comments.paginate(page: params[:page],per_page: 5)
   
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
img_name = params[:img].original_filename

#if exists params[:img] then
#img_name = params[:img].original_filename
 #   p = params[:img]

#    File.binwrite("/home/vagrant/rails_origin/first_app/public/post_img/#{@article.img_name}",p.read)
#	end
          
@article.update(
            title:params[:title],
      contents:params[:contents],
      img_name: img_name,
      img_style:params[:style],
      color: params[:color],
      author:@article.author
    )
@article.save
	
    p = params[:img]

    File.binwrite("/home/vagrant/rails_origin/first_app/public/post_img/#{@article.img_name}",p.read)
	

    flash[:success] = "編集完了"
          redirect_to root_path


    #else
     #render 'edit'
   #end

  end

  def new
    @article = Article.new

  end


    def create

    
    #render plain: params[:img_name].inspect
    # render plain: params[:img].original_filename
    # render plain: params[:img].original_filename.inspect
    

    img_name = params[:img].original_filename
    @article = Article.new(
      title:params[:title],
      contents:params[:contents],
      img_name: img_name,
      img_style:params[:style],
      color: params[:color],
      author:session[:user_id]
    )

    p = params[:img]

    File.binwrite("/home/vagrant/rails_origin/first_app/public/post_img/#{@article.img_name}",p.read)

    @article.save
flash[:success] = "投稿完了"
    redirect_to root_path
  end


end