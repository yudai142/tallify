# Ensure logger is properly initialized even in server context
if defined?(Rails) && Rails.application
  if Rails.logger.nil? || Rails.logger.formatter.nil?
    if ENV['RAILS_LOG_TO_STDOUT'].present?
      logger = ActiveSupport::Logger.new($stdout)
    else
      logger = ActiveSupport::Logger.new(File.join(Rails.root, 'log', "#{Rails.env}.log"))
    end
    
    logger.formatter = ::Logger::Formatter.new
    Rails.logger = logger unless Rails.logger
  end
end
