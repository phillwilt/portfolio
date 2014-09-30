class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]
  before_action :authenticate_user!, only: [:update]

  def show
  end

  def index
    @comments = policy_scope(Comment)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment[:article_id] = params[:article_id]
    if @comment.save
      redirect_to article_path(@comment.article_id)
      flash[:notice] = 'Comment pending approval'
    else
      render current_article, notice: 'We could not create your comment'
    end
  end

  def update
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(policy(Comment).permitted_attributes)
  end
end
