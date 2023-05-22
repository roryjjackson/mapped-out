class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      scope.where("user_id = ? OR user2_id = ?", user.id, user.id)

    end
  end

  def show?
    true
  end

  def create?
    true
  end
end
