class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      if @user.author? || @user.editor?
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end

  def approval?
    user.editor? || user.author?
  end

  def destroy?
    user.editor? || user.author?
  end

  def permitted_attributes
    if approval?
      [:author,
       :author_email,
       :user_ip,
       :user_agent,
       :referrer,
       :author_url,
       :content,
       :article_id,
       :approved
      ]
    else
      [:author,
       :author_email,
       :user_ip,
       :user_agent,
       :referrer,
       :author_url,
       :content,
       :article_id
      ]
    end
  end
end
