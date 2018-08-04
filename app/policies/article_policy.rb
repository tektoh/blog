class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.admin? || user.editor?
  end

  def update?
    true
  end

  def destroy?
    user.admin? || user.editor?
  end
end
