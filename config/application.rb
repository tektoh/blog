require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.available_locales = %i[ja]
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.action_view.sanitized_allowed_tags = %w[
      h1 h2 h3 h4 h5 h6
      div p section article nav
      ul ol li
      strong em strike b i s
      a img
    ]

    config.action_view.sanitized_allowed_attributes = %w[
      href title
    ]

    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
