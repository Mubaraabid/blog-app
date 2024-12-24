class ArticlePolicy < ApplicationPolicy

  def create?
    user.present? 
  end

  def update?
    user.admin? || record.user == user 
  end

  def destroy?
    user.admin? || record.user == user 
  end

  def show?
    true
  end
end
