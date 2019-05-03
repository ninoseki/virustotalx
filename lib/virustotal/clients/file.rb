# frozen_string_literal: true

module VirusTotal
  module Client
    class File < Base
      def report(resource, allinfo: nil)
        params = { resource: resource, allinfo: allinfo }.compact
        post("/file/report", params) do |json|
          handle_response_code json
        end
      end

      def scan(path)
        name = ::File.basename(path)
        data = ::File.read(path)
        post_with_file("/file/scan", filename: name, file: data) { |json| json }
      end

      def rescan(resource)
        post("/file/rescan", resource: resource) { |json| json }
      end

      def upload_url
        get("/file/scan/upload_url") { |location| location }
      end

      def download(hash)
        get("/file/download", hash: hash) { |raw| raw }
      end

      def behaviour(hash)
        get("/file/behaviour", hash: hash) { |json| json }
      end

      def network_traffic(hash)
        get("/file/network-traffic", hash: hash) { |json| json }
      end

      def clusters(date)
        get("/file/clusters", date: date) { |json| json }
      end

      def search(query, offset: nil)
        params = { query: query, offset: offset }.compact
        get("/file/search", params) { |json| json }
      end
    end
  end
end
