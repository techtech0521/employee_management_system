class UserPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    user.administrator_flag? || record == user
  end

  def create?
    user.administrator_flag?
  end

  def new?
    create?
  end

  def update?
    user.administrator_flag? || record == user
  end

  def edit?
    update?
  end

  def destroy?
    user.administrator_flag?
  end

  def permitted_attributes_for_update
    if user.administrator_flag?
      [:administrator_flag, :employee_number, :name, :furigana, :department, :phone_number, :email, :password, :password_confirmation]
    else
      [:password, :password_confirmation]
    end
  end
end
