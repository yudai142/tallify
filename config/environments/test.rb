require_relative 'application'

Rails.application.initialize!

Rails.env = 'test' unless defined?(Rails.env)

ENV['RAILS_ENV'] = 'test'
