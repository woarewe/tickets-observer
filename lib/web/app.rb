# frozen_string_literal: true

module Web
  class App < Hanami::API
    get "/" do
      ENV.fetch("PORT", 3000)
    end
  end
end
