require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Tallify
  class Application < Rails::Application
    config.load_defaults 7.0

    config.api_only = false
    
    config.generators do |g|
      g.orm :active_record
      g.test_framework :rspec, fixture: true
    end

    # Timezone
    config.time_zone = 'Asia/Tokyo'

    # i18n
    config.i18n.default_locale = :en
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    # ActionCable adapter
    config.action_cable.adapter = :async
  end
end
