# Test helper configuration - enables RSpec DSL globally
require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!
  config.default_formatter = "progress" if config.files_to_run.one?
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed

  # Include RSpec DSL into Object for top-level tests
  config.include RSpec::Core::DSL
end
