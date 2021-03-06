class BrandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_athlete
        scope.all
      end
    end
  end

  def show?
    user.is_athlete == true || user == record.user
  end

  def create?
    !user.is_athlete && user.brand.nil?
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
