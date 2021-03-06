require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'

Bundler.require(*Rails.groups)

module RefactoredEnigma
  class Application < Rails::Application
    config.load_defaults 5.1
    config.cache_store = :redis_store, "#{Rails.application.secrets.redis_url}/0/cache"

    config.api_only = true

    config.generators do |g|
      g.test_framework :rspec
      g.stylesheets false
      g.factory_bot true
    end
  end
end
