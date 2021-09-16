require "bundler/setup"
require "dotenv"

Dotenv.load

ROOT = File.expand_path("..", __dir__)

Bundler.require(:default)

require "sidekiq/web"
require "securerandom"
require "hanami/middleware/body_parser"

require_relative "sidekiq"

Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir(File.expand_path("lib", ROOT))
  loader.setup
  loader.eager_load
end

