# frozen_string_literal: true

module Workers
  class CheckAvailability
    include Sidekiq::Worker

    def perform(*)
      result = Core::Tickets.available?(from: "Orša Centraĺnaja", to: "Minsk Pasažyrski", date: "2021-12-19", train: "865Б")
      return unless result

      body = {
        chat_id: 385181870,
        text: "There are available tickets!!!"
      }

      Faraday.post(
        "https://api.telegram.org/bot#{ENV.fetch("BOT_API_TOKEN")}/sendMessage",
        body.to_json,
        { "Content-Type" => "application/json" }
      )
    end
  end
end
