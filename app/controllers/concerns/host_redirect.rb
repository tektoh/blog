# frozen_string_literal: true

module HostRedirect
  extend ActiveSupport::Concern

  private
    def redirect_to_site_host
      return if Settings.host.blank?

      if request.host != Settings.host
        redirect_to host: Settings.host, status: 301
      end
    end
end
