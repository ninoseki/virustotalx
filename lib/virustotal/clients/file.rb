# frozen_string_literal: true

module VirusTotal
  module Client
    class File < Object
      def upload(path)
        name = ::File.basename(path)
        data = ::File.read(path)
        _post_with_file("/files", file: data, filename: name) { |json| json }
      end

      def upload_url
        _get("/files/upload_url") { |json| json }
      end

      def analyse(hash)
        _post("/files/#{hash}/analyse") { |json| json }
      end

      def votes(hash)
        _get("/files/#{hash}/votes") { |json| json }
      end

      def add_vote(hash, verdict)
        params = {
          data: {
            type: "vote",
            attributes: {
              verdict: verdict
            }
          }
        }
        _post("/files/#{hash}/votes", params) { |json| json }
      end

      def download_url(hash)
        _get("/files/#{hash}/download_url") { |json| json }
      end

      def download(hash)
        _get("/files/#{hash}/download") { |location| location }
      end

      def pcap(id)
        _get("/file_behaviours/#{id}/pcap") { |raw| raw }
      end

      private

      def relationships
        %w(
          analyses
          behaviours
          bundled_files
          carbonblack_children
          carbonblack_parents
          compressed_parents
          contacted_domains
          contacted_ips
          contacted_urls
          email_parents
          embedded_domains
          embedded_ips
          execution_parents
          graphs
          itw_urls
          overlay_parents
          pcap_parents
          pe_resource_parents
          similar_files
          submissions
          screenshots
          votes
        ).map(&:to_sym)
      end
    end
  end
end
