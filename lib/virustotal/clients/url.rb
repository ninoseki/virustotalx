# frozen_string_literal: true

module VirusTotal
  module Client
    class URL < Base
      def report(resource, allinfo: nil)
        params = { resource: resource, allinfo: allinfo }.compact
        post("/url/report", params) { |json| json }
      end

      def scan(url)
        post("/url/scan", url: url) { |json| json }
      end
    end
  end
end
