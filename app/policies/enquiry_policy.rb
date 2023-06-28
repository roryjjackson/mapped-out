class EnquiryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def destroy?
    user.admin?
  end

  def create?
    true
  end
end
