# frozen_string_literal: true

class AdminController < ApplicationController
  include Pundit

  protect_from_forgery with: :exception
end
