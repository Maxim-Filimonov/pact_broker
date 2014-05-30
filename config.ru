require 'fileutils'
require 'logger'
require 'sequel'
require 'pact_broker'
require 'rack/hal_browser'

app = PactBroker::App.new do | config |
  # change these from their default values if desired
  # config.log_dir = "./log"
  # config.auto_migrate_db = true
  # config.use_hal_browser = true
  config.database_connection = Sequel.connect(ENV['DATABASE_URL'],logger: config.logger)
end

run app
