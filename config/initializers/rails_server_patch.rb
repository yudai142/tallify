# Prevent "undefined method `formatter' for nil" error when starting Puma server
# This is a workaround for a Rails 7.0 issue where the logger might be nil during server startup

module RailsServerLoggerFix
  def log_to_stdout
    return if Rails.logger.nil?
    
    # Ensure formatter is not nil
    Rails.logger.formatter ||= ::Logger::Formatter.new
    
    console = ActiveSupport::Logger.new($stdout)
    console.formatter = Rails.logger.formatter
    
    Rails.logger.extend(ActiveSupport::Logger.broadcast(console))
  end
end

# Patch the server command
if defined?(Rails::Commands::Server::ServerCommand)
  Rails::Commands::Server::ServerCommand.prepend(RailsServerLoggerFix)
elsif ARGV.include?('s') || ARGV.include?('server')
  # If not loaded yet, configure it to be loaded
  at_exit do
    if defined?(Rails::Commands::Server::ServerCommand) && !Rails::Commands::Server::ServerCommand < RailsServerLoggerFix
      Rails::Commands::Server::ServerCommand.prepend(RailsServerLoggerFix)
    end
  end
end
