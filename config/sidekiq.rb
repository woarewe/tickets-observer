Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("REDIS_URL") }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDIS_URL") }
end

Sidekiq::Web.use Rack::Auth::Basic do |login, password|
  rules = [
    lambda do
      Rack::Utils.secure_compare(
        ::Digest::SHA256.hexdigest(ENV.fetch("ADMIN_USERNAME")),
        ::Digest::SHA256.hexdigest(login),
      )
    end,
    lambda do
      Rack::Utils.secure_compare(
        ::Digest::SHA256.hexdigest(ENV.fetch("ADMIN_PASSWORD")),
        ::Digest::SHA256.hexdigest(password),
      )
    end
  ]
  rules.all?(&:call)
end
