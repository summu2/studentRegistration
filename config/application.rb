require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Students
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        if Rails.env.development? || Rails.application.config.cors_allow_all_origins == 'true'
          origins { |source, env| source }
        else
          origins Rails.application.config.cors_origins
        end
        resource '*', :headers => :any, :methods => [:get, :post, :options, :put], :credentials => true
      end
    end
  end
end
