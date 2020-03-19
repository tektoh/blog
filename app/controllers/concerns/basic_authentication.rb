# frozen_string_literal: true

module BasicAuthentication
  extend ActiveSupport::Concern

  private
    def authenticate_http_basic
      return if authenticate_http_basic?

      authenticate_or_request_with_http_basic do |user, password|
        user == Settings.basic_authentication.user &&
          password == Settings.basic_authentication.password
      end
    end

    def authenticate_http_basic?
      Settings.basic_authentication&.user.blank? ||
        request.user_agent == Settings.basic_authentication.allow_user_agent
    end
end
