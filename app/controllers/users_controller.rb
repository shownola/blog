class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]


  def index
    @users = User.all
  end

  def show
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username} You have successfully signed up"
      redirect_to @user
    else
      flash[:error] = "There was an error, please try again"
      render 'new'
    end
  end

  def update
      if @user.update(user_params)
        flash[:notice] = "User was successfully updated."
        redirect_to @user
      else
        flash[:error] = 'There was an error, please try again!'
        render 'edit'
      end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
