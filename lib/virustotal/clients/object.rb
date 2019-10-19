# frozen_string_literal: true

module VirusTotal
  module Client
    class Object < Base
      CONVERT_TABLE = {
        ipaddress: "ip_addresses",
        domain: "domains",
        url: "urls",
        file: "file"
      }.freeze

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

      def relationships
        []
      end

      def method_missing(method, *args)
        if relationships.include?(method)
          id = to_id(args.first)
          params = args.length == 2 ? args[1] : {}

          _get("/#{name}/#{id}/#{method}", params) { |json| json }
        else
          super
        end
      end

      def respond_to_missing?(method_name, *)
        relationships.include? method_name
      end

      private

      def to_id(id)
        id
      end

      def klass
        self.class.to_s.split("::").last.to_s.downcase.to_sym
      end

      def name
        CONVERT_TABLE.fetch klass
      end
    end
  end
end
