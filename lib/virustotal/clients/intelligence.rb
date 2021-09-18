# frozen_string_literal: true

module VirusTotal
  module Client
    class Intelligence < Base
      #
      # Intelligense search
      #
      # @param [String] query Search query
      # @param [String, nil] order Sort order
      # @param [Integer, nil] limit Maximum number of results
      # @param [String, nil] cursor Continuation cursor
      # @param [Boolean, nil] descriptors_only Whether to return full object information or just object descriptors
      #
      # @return [Hash]
      #
      def search(query, order: nil, limit: nil, cursor: nil, descriptors_only: nil)
        params = {
          query: query,
          order: order,
          limit: limit,
          cursor: cursor,
          descriptors_only: descriptors_only
        }.compact

        _get("/#{name}/search", params) { |json| json }
      end
    end
  end
end
