# frozen_string_literal: true

class SitePolicy < ApplicationPolicy
  def update?
    user.admin?
  end

  def permitted_attributes
    %i[name subtitle description favicon cover_image og_image gtag]
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
