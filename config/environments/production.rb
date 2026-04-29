require_relative 'application'

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = false
  config.active_storage.service = :local
  config.log_level = :info
  config.log_tags = [:request_id]
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.i18n.fallbacks = [I18n.default_locale]
  config.active_record.dump_schema_after_migration = false
end

Rails.application.initialize!
