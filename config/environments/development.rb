Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.log_level = :debug
  config.active_record.migration_error = :page_load
  config.active_storage.service = :local
  config.action_mailer.perform_deliveries = false
  config.action_mailer.raise_delivery_errors = false
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.hosts.clear
  
  # Logger configuration
  config.logger = ActiveSupport::Logger.new($stdout)
  config.logger.formatter = ::Logger::Formatter.new
  config.log_tags = :request_id
end
