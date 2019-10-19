# frozen_string_literal: true

module VirusTotal
  module Client
    module HasVotes
      #
      # Retrieve votes for an object
      #
      # @param [String] id Object identifier
      #
      # @return [Hash]
      #
      def votes(id)
        id = to_id(id)
        _get("/#{name}/#{id}/votes") { |json| json }
      end

      #
      # Add a vote for an object
      #
      # @param [String] id Object identifier
      # @param [String] verdict harmless or malicious
      #
      # @return [Hash]
      #
      def add_vote(id, verdict)
        id = to_id(id)
        params = {
          data: {
            type: "vote",
            attributes: {
              verdict: verdict
            }
          }
        }
        _post("/#{name}/#{id}/votes", params) { |json| json }
      end
    end
  end
end
