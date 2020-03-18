# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome, screen_size: [1280, 800], options: {
      args: %w[headless disable-gpu no-sandbox disable-setuid-sandbox]
    }
  end
end
