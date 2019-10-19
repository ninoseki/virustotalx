# frozen_string_literal: true

module VirusTotal
  module Client
    module HasRelationships
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
    end
  end
end
