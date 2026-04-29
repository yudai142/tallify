require_relative 'application'

Rails.application.initialize!

Rails.env = 'development' unless defined?(Rails.env)

Rails.logger ||= ActiveSupport::Logger.new(STDOUT)
