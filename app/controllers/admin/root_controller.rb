# frozen_string_literal: true

class Admin::RootController < AdminController
  def index
    redirect_to admin_dashboard_path
  end
end
