class HobbyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def index?
    user.admin
  end

  def create?
    user.admin
  end

  def destroy?
    user.admin
  end

  def update?
    user.admin
  end
end
