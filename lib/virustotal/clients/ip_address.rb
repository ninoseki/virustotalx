# frozen_string_literal: true

module VirusTotal
  module Client
    class IPAddress < Base
      include Action::Comments
      include Action::Get
      include Action::Relationships

      private

      def relationships
        @relationships ||= %w(
          communicating_files
          downloaded_files
          graphs
          historical_whois
          referrer_files
          resolutions
          urls
        ).map(&:to_sym)
      end
    end
  end
end
