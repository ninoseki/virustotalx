# frozen_string_literal: true

module VirusTotal
  module Client
    module HasGet
      #
      # Retrieve information about an object
      #
      # @param [String] id Object identifier
      #
      # @return [Hash]
      #
      def get(id)
        id = to_id(id)
        _get("/#{name}/#{id}") { |json| json }
      end
    end
  end
end
