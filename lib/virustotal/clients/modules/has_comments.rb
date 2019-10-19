# frozen_string_literal: true

module VirusTotal
  module Client
    module HasComments
      #
      # Retrieve comments for an object
      #
      # @param [String] id Object identifier
      #
      # @return [Hash]
      #
      def comments(id)
        id = to_id(id)
        _get("/#{name}/#{id}/comments") { |json| json }
      end

      #
      # Add a comment to an object
      #
      # @param [String] id Object identifier
      # @param [String] text
      #
      # @return [Hash]
      #
      def add_comment(id, text)
        id = to_id(id)
        params = {
          data: {
            type: "comment",
            attributes: {
              text: text
            }
          }
        }
        _post("/#{name}/#{id}/comments", params) { |json| json }
      end
    end
  end
end
