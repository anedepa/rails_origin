class ComentsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]
  protect_from_forgery

  def create

    @article=Article.find(params[:id])


    # @article=Article.find(this_article)
    # @article=Article.find_by(id:params[:id])
    # @coment = article.coments.build(coment_params)
    @coment = @article.coments.build(coment_params)
    # @coment = current_user.microposts.build(micropost_params)
    # @coment = this_article.self.build(coment_params)
    # @coment = this_article.coments.build(coment_params)
    if @coment.save
      flash[:success] = "coment created!"
      # redirect_to article_url
      redirect_to request.referrer
    else
      # render 'static_pages/home'
      # render 'articles/index'
      flash[:danger] = "coment not created..."
        redirect_to request.referrer
    end
  end

  def destroy
  end



  private
  def coment_params
   params.require(:coment).permit(:content)
 end

 def this_article
    @this_article ||= Article.find_by(id: session[:id])
  end
 def this_coment
    @this_coment = Coment.find_by(article: session[:id])
    # @this_coment ||= Coment.find_by(article: session[:id])
  end
end
