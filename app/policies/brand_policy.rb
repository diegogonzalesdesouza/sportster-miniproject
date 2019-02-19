class BrandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.is_athlete == true || user == record.user
  end

  def create?
    !user.is_athlete && Brand.where(user: user) == []
  end

  def update?
    user == record.user
  end

  def destroy
    user == record.user
  end
end
