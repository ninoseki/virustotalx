# frozen_string_literal: true

module VirusTotal
  module Client
    class Analysis < Base
      #
      # Retrieve information about a file or URL analysis
      #
      # @see https://developers.virustotal.com/v3.0/reference#analysis-1
      #
      # @param [String] id Analysis identifier
      #
      # @return [Hash]
      #
      def get(id)
        _get("/analyses/#{id}") { |json| json }
      end
    end
  end
end
