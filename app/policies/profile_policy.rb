class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def update?
    # record.user == user
    true
  end

  def total_score
    true
  end

  def total_rating
    true
  end
end
