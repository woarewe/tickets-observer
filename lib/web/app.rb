# frozen_string_literal: true

TELEGRAM_WEBHOOK = lambda do |env|
  params = env.fetch("router.params")
  token = params.fetch(:token)
  return [401, {}, []] if token != ENV.fetch("BOT_WEBHOOK_TOKEN")

  [200, {},[params.inspect]]
end

module Web
  App = Hanami::Router.new do
    mount Sidekiq::Web, at: "/sidekiq"

    scope "webhooks" do
      post "/telegram/:token", to: TELEGRAM_WEBHOOK
    end
  end
end
