class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.paginate(page: params[:page], per_page: 5)
    #@comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    #@article.user = User.first
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Your article was created successfully'
      redirect_to @article
    else
      flash.now[:alert] = 'There was an error, please try again'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article has been updated"
      redirect_to @article
    else
      flash.now[:alert] = 'There was an error, please try again!'
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = 'You can only edit and delete your own articles'
      redirect_to articles_path
    end
  end

end
