class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy]
  before_action :require_user, only: %i[edit update]
  before_action :require_same_user, only: %i[edit update destroy]


  def index
    @users = User.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
      if @user.update(user_params)
        flash[:notice] = "User was successfully updated."
        redirect_to @user
      else
        flash[:alert] = 'There was an error, please try again!'
        render 'edit'
      end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username} You have successfully signed up"
      redirect_to articles_path
    else
      flash[:alert] = "There was an error, please try again"
      render 'new'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = 'Account and associated articles deleted'
    redirect_to articles_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:alert] = 'You can only edit your own profile'
        redirect_to @user
      end
    end


end
