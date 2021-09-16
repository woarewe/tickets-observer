# frozen_string_literal: true

require_relative "config/boot"

use Honeybadger::Rack::ErrorNotifier
use Rack::Session::Cookie, secret: ENV.fetch("SESSION_SECRET"), same_site: true, max_age: 86400
use Hanami::Middleware::BodyParser, :json

run Web::App
