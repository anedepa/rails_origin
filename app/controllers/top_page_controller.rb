class TopPageController < ApplicationController

  def index
    @per = session[:per] || 5
    @articles = Article.paginate(page: params[:page],per_page: @per).order(created_at:'desc')
    
  end

  def new  
   session[:per] = params[:per]
   redirect_to root_url
  end

end
