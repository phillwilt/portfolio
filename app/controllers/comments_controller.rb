class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update]
  before_action :authenticate_user!, only: [:update]

  def show
  end

  def index
    @article = Article.find(params[:article_id])
    @comments = policy_scope(@article.comments)
  end

  def new
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to article_path(@comment.article_id)
      flash[:notice] = 'Comment pending approval'
    else
      render current_article, notice: 'We could not create your comment'
    end
  end

  def update
    @article = @comment.article
    if @comment.update_attributes(comment_params)
      if @comment.approved?
        flash[:notice] = "Comment approved"
      else
        flash[:notice] = "Comment unapproved"
      end
      redirect_to article_path(@article)
    else
      render 'articles/article'
    end
  end

  def destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(policy(Comment).permitted_attributes)
  end
end
