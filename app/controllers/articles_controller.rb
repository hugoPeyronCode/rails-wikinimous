class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  def index
    @articles = Article.all # save into @articles all the articles in my db
  end

  def show
    #@article = Article.find(params[:id]) # Get id from the article I want to show in my view and save into a variable
  end

  def new
    @article = Article.new # create a new article and save it into a @article variable.
  end

  def create
    # save into @article variable a new instance of the article class with the param from the form in my view
    @article = Article.new(article_params)
    @article.save # if my new article is saved in my db
    redirect_to articles_path # redirect me to the article page. Might need to change for articles
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def update
    #@article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end

  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
