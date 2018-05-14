class SitePolicy < ApplicationPolicy
  def update?
    user.admin?
  end

  def permitted_attributes
    %i[name subtitle description favicon og_image]
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
