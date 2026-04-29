version = File.read(File.expand_path('../RAILS_VERSION', __dir__)).strip

Rails::VERSION::STRING = version
Rails::VERSION::MAJOR = version.split('.')[0].to_i
Rails::VERSION::MINOR = version.split('.')[1].to_i
Rails::VERSION::TINY = version.split('.')[2].to_i
Rails::VERSION::PRE = nil
