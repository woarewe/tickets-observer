# frozen_string_literal: true

module Web
  App = Hanami::Router.new do
    mount Sidekiq::Web, at: "/sidekiq"
  end
end
