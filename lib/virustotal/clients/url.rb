# frozen_string_literal: true

module VirusTotal
  module Client
    class URL < Base
      def report(resource)
        post("/url/report", resource: resource) { |json| json }
      end

      def scan(url)
        post("/url/scan", url: url) { |json| json }
      end
    end
  end
end
