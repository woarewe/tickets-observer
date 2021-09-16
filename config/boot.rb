require "bundler/setup"

ROOT = File.expand_path("..", __dir__)

Bundler.require(:default)

require "sidekiq/web"
require "securerandom"

Dotenv.load

require_relative "sidekiq"

Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir(File.expand_path("lib", ROOT))
  loader.setup
  loader.eager_load
end

