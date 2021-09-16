# frozen_string_literal: true

require_relative "config/boot"

use Rack::Session::Cookie, secret: ENV.fetch("SESSION_SECRET"), same_site: true, max_age: 86400
run Web::App
