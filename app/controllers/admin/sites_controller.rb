# frozen_string_literal: true

class Admin::SitesController < ApplicationController
  layout "admin"

  skip_before_action :require_login, only: %i[new create]
  skip_before_action :initialize_site, only: %i[new create]

  before_action :set_site, only: %i[edit update]

  def new
    return redirect_to admin_dashboard_path if current_site.present?

    @site = Site.new
    @user = User.new

    render layout: "initialize"
  end

  def create
    return redirect_to admin_dashboard_path if current_site.present?

    @site = Site.new(create_site_params)
    @user = User.new(create_user_params)

    if @site.valid? & @user.valid?
      User.transaction do
        @site.save!
        @user.admin!
      end

      auto_login(@user)

      redirect_to admin_dashboard_path
    else
      render :new, layout: "initialize"
    end
  end

  def edit
    authorize(@site)
  end

  def update
    authorize(@site)

    if @site.update(update_site_params)
      redirect_to edit_admin_site_path
    else
      render :edit
    end
  end

  private

    def create_site_params
      params.require(:site).permit(
        SitePolicy.new(User.new(role: :admin), :site).permitted_attributes
      )
    end

    def create_user_params
      params.require(:user).permit(
        UserPolicy.new(User.new(role: :admin), :user).permitted_attributes
      )
    end

    def update_site_params
      params.require(:site).permit(policy(:site).permitted_attributes)
    end

    def set_site
      @site = Site.find(current_site.id)
    end
end
