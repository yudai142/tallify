# Puma configuration for Rails 7

max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }

pidfile ENV.fetch("PIDFILE") { "tmp/pids/puma.pid" }

# Logging - only configure if RAILS_LOG_TO_STDOUT is set
if ENV['RAILS_LOG_TO_STDOUT']
  stdout_redirect 'log/puma.stdout.log', 'log/puma.stderr.log', true
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

