class AthletePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user.is_athlete == false
    end
  end

  def show?
    !user.is_athlete || user == record.user
  end

  def create?
    user.is_athlete && Athlete.where(user: user) == []
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
