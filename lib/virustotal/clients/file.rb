# frozen_string_literal: true

module VirusTotal
  module Client
    class File < Base
      def report(resource)
        post("/file/report", resource: resource) { |json| json }
      end

      def scan(path)
        name = ::File.basename(path)
        data = ::File.read(path)
        post_with_file("/file/scan", filename: name, file: data) { |json| json }
      end

      def rescan(resource)
        post("/file/rescan", resource: resource) { |json| json }
      end
    end
  end
end
