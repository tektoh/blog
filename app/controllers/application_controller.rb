# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  before_action :initialize_site, if: -> { current_site.blank? }

  private

    def not_authenticated
      redirect_to admin_login_identifier_path
    end

    def initialize_site
      redirect_to new_admin_site_path
    end

    def current_site
      @current_site ||= Site.first
    end
    helper_method :current_site

    def preview!
      @preview = true
    end

    def preview?
      @preview
    end
    helper_method :preview?

    def categories
      @categories ||= Category.all
    end
    helper_method :categories

    def new_arrival_articles
      @new_arrival_articles ||= Article.new_arrivals.limit(3)
    end
    helper_method :new_arrival_articles
end
