class ArticlesController < ApplicationController

  # indexにアクセスした時articleのデータ全部をインスタンス変数に入れる
  def index
    
    @articles = Article.paginate(page: params[:page],per_page: 5).order(created_at:'desc')
    # @comments = @article.comments.order(created_at:'desc')
    
  end

  def index_per
    
    @page = params[:per]
    @articles = Article.paginate(page: params[:page],per_page: @page).order(created_at:'desc')
    render("index")
  end

  def show
    @article=Article.find(params[:id])
    # @article=Article.comments.paginate(page: params[:page],per_page: 5)

    # @coment = @article.comments.paginate(page: params[:page])
    @microposts = @article.comments.paginate(page: params[:page],per_page: 5)
    # @form = @article.comments.build
  end

  def edit
    @article=Article.find(params[:id])
  end

  def update
    @article=Article.find(params[:id])


          if @article.update(
            title:params[:title],
      contents:params[:contents],
      img_name: img_name,
      img_style:params[:style],
      color: params[:color]
    )

    p = params[:img]

    File.binwrite("/home/vagrant/rails_origin/first_app/public/post_img/#{@article.img_name}",p.read)

    @article.save

    
          redirect_to articles_path


    else
     render 'edit'
   end

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

    redirect_to root_path
  end


end