# frozen_string_literal: true

class Admin::LogoutsController < ApplicationController
  def destroy
    logout
    redirect_to admin_root_path
  end
end
