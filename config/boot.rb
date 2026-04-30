ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Set up RAILS_LOG_TO_STDOUT automatically in development if running as server
if ENV['RAILS_LOG_TO_STDOUT'].to_s.empty? && (ARGV.include?('s') || ARGV.include?('server') || ARGV.include?('puma'))
  ENV['RAILS_LOG_TO_STDOUT'] = 'true'
end

require 'bundler/setup'
