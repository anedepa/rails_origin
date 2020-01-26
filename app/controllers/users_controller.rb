class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    #@user = User.find(params[:id])
@user = User.find(session[:user_id])
  end

  def show
    @user = User.find(params[:id])
@articles=Article.where(author:session[:user_id])

  end

  def new
    @user = User.new
  end


  def create
    # render plain: user_params.inspect
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそ!試用アプリへ"
      redirect_to @user
    else
      render 'new'
    end
  end

def destroy
@user = User.find(params[:id])
@user.destroy
flash[:info] = "ユーザー情報は全て削除されました"
redirect_to root_path
end


def edit
@user = User.find(session[:user_id])
end

def update
   @user = User.find(params[:id])
   if @user.update_attributes(user_params)
     flash[:success] = "プロフィールが更新されました"
     redirect_to @user
   else
     render 'edit'
   end
 end
  private

  def user_params
   params.require(:user).permit(:name, :email, :password,
                                :password_confirmation,:color)
 end

 # beforeフィルター

 # 正しいユーザーかどうかを確認
 def correct_user
   @user = User.find(params[:id])
   redirect_to(root_url) unless current_user?(@user)
 end

 # 管理者かどうかを確認
 def admin_user
   redirect_to(root_url) unless current_user.admin?
 end
end
