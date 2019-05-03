# frozen_string_literal: true

module VirusTotal
  module Client
    class IPAddress < Base
      def report(ip)
        get("/ip-address/report", ip: ip) do |json|
          handle_response_code json
        end
      end
    end
  end
end
