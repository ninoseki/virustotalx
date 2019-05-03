# frozen_string_literal: true

module VirusTotal
  module Client
    class Domain < Base
      def report(domain)
        get("/domain/report", domain: domain) do |json|
          handle_response_code json
        end
      end
    end
  end
end
