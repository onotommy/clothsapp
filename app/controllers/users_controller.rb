class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      email: params[:email], password: params[:password], nickname: params[:nickname], tall: params[:tall], weight: params[:weight])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/#{@user.id}/login_top")
    else
      render("users/new")
    end
  end
  
  def login_form
  end
  
  def login
  @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      # @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/#{@user.id}/login_top") 
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
end
