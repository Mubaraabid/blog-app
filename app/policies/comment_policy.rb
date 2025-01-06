class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def show?
    true
  end
end
