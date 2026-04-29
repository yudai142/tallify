require 'rake'

Rake::TaskManager.record_task_metadata = true

APP_RAKEFILE = File.expand_path('../Rakefile', __dir__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/railtie.rake'

Rake.application.instance_eval do
  @name = 'rails'
end

require_relative '../config/application'

Rails.application.load_tasks
Rails.application.load_seed
