# frozen_string_literal: true

module VirusTotal
  module Client
    class URL < Base
      def report(resource, allinfo: nil)
        params = { resource: resource, allinfo: allinfo }.compact
        post("/url/report", params) do |json|
          handle_response_code json
        end
      end

      def scan(url)
        post("/url/scan", url: url) { |json| json }
      end
    end
  end
end
