# frozen_string_literal: true

module Web
  class App < Hanami::API
    get "/" do
      "Hello world!"
    end
  end
end
