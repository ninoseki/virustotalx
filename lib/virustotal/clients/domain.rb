# frozen_string_literal: true

module VirusTotal
  module Client
    class Domain < Base
      include HasComments
      include HasGet
      include HasRelationships

      private

      def relationships
        @relationships ||= %w(
          communicating_files
          downloaded_files
          graphs
          historical_whois
          referrer_files
          resolutions
          siblings
          urls
        ).map(&:to_sym)
      end
    end
  end
end
