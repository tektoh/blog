# frozen_string_literal: true

class Admin::LogoutsController < AdminController
  def destroy
    logout
    redirect_to admin_root_path
  end
end
