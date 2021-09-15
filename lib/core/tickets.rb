# frozen_string_literal: true

module Core
  module Tickets
    extend self

    def available?(from:, to:, date:, train:)
      page_content = load_page(from, to, date)
      fetch_availability(page_content, train)
    end

    private

    def load_page(from, to, date)
      url = URI::HTTPS.build(
        host: "pass.rw.by",
        path: "/en/route/",
        query: URI.encode_www_form(from: from, to: to, date: date)
      ).to_s
      Faraday.get(url).body
    end

    def fetch_availability(content, train)
      doc = Nokogiri::HTML(content)
      node = doc.at_xpath(%(//div[contains(@data-train-number, '#{train}')]))
      return false if node.nil?

      node.attributes["data-ticket_selling_allowed"].value == "true"
    end
  end
end
