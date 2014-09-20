class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html do
          redirect_to @article, notice: 'Article was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articles/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html do
          redirect_to @article, notice: 'Article was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    respond_to do |format|
      format.html do
        redirect_to articles_url, notice: 'Article was successfully destroyed.'
      end
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
    params.require(:article).permit(:title, :body)
  end
end
