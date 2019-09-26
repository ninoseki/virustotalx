# frozen_string_literal: true

module VirusTotal
  module Client
    class Analysis < Base
      def get(id)
        _get("/analyses/#{id}") { |json| json }
      end
    end
  end
end
