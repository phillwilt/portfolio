class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initalize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user && @user.author?
        scope.where(author_id: @user.id)
      elsif @user && @user.editor?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def new?
    @user.editor? || @user.author? if @user
  end

  def create?
    @user.author? if @user
  end

  def edit?
    @user.editor? || @user.author? if @user
  end

  def publish?
    @user.editor? if @user
  end

  def destroy?
    user.editor? if @user
  end

  def permitted_attributes
    if publish?
      [:title, :body, :published]
    else
      [:title, :body]
    end
  end
end
