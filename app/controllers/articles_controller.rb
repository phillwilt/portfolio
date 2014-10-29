class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /articles
  # GET /articles.json
  def index
    @articles = policy_scope(Article)
  end

  # GET /articles/1
  def show
    @comment = @article.comments.build
    @comments = policy_scope(@article.comments)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.js
    end
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        current_user.articles << @article
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.js
      else
       format.html { render :edit }
     end
    end
  end

  # DELETE /articles/1
  def destroy
    respond_to do |format|
      @article.destroy
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def article_params
    params.require(:article).permit(policy(Article).permitted_attributes)
  end
end
