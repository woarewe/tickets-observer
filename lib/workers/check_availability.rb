# frozen_string_literal: true

module Workers
  class CheckAvailability
    include Sidekiq::Worker

    def perform(*)
      Core::Tickets.available?(from: "Orša Centraĺnaja", to: "Minsk Pasažyrski", date: "2021-09-19", train: "865Б")
    end
  end
end
