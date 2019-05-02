# frozen_string_literal: true

module VirusTotal
  module Client
    class IPAddress < Base
      def report(ip)
        get("/ip-address/report", ip: ip) { |json| json }
      end
    end
  end
end
