# Puma configuration for Rails 7

max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }

pidfile ENV.fetch("PIDFILE") { "tmp/pids/puma.pid" }

# Logging
if ENV['RAILS_LOG_TO_STDOUT'].present?
  stdout_redirect 'log/puma.stdout.log', 'log/puma.stderr.log', true
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# Set up proper logging before Rails is initialized
unless defined?(Rails.logger) && Rails.logger && Rails.logger.formatter
  begin
    require 'active_support/logger'
    if ENV['RAILS_LOG_TO_STDOUT'].present?
      logger = ActiveSupport::Logger.new($stdout)
    else
      logger = ActiveSupport::Logger.new('log/puma.log')
    end
    logger.formatter = ::Logger::Formatter.new
    Object.const_set('PUMA_LOGGER', logger)
  rescue => e
    warn "Failed to initialize logger: #{e.message}"
  end
end
