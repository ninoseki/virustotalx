# frozen_string_literal: true

module VirusTotal
  module Client
    class File < Base
      include Action::Comments
      include Action::Get
      include Action::Relationships
      include Action::Votes

      #
      # Upload and analyse a file
      #
      # @see https://developers.virustotal.com/v3.0/reference#files-scan
      #
      # @param [String] path File path to be scanned
      #
      # @return [Hash]
      #
      def upload(path)
        name = ::File.basename(path)
        data = ::File.read(path)
        _post_with_file("/files", file: data, filename: name) { |json| json }
      end

      #
      # Get a URL for uploading files larger than 32MB
      #
      # @see https://developers.virustotal.com/v3.0/reference#files-upload-url
      #
      # @return [Hash]
      #
      def upload_url
        _get("/files/upload_url") { |json| json }
      end

      #
      # Reanalyse a file already in VirusTotal
      #
      # @see https://developers.virustotal.com/v3.0/reference#files-analyse
      #
      # @param [String] hash SHA-256, SHA-1 or MD5 identifying the file
      #
      # @return [Hash]
      #
      def analyse(hash)
        _post("/files/#{hash}/analyse") { |json| json }
      end

      #
      # Get a download URL for a file
      #
      # @see https://developers.virustotal.com/v3.0/reference#files-download-url
      #
      # @param [String] hash SHA-256, SHA-1 or MD5 identifying the file
      #
      # @return [Hash]
      #
      def download_url(hash)
        _get("/files/#{hash}/download_url") { |json| json }
      end

      #
      # Download a file
      #
      # @see https://developers.virustotal.com/v3.0/reference#files-download
      #
      # @param [String] SHA-256, SHA-1 or MD5 identifying the file
      #
      # @return [<Type>] <description>
      #
      def download(hash)
        _get("/files/#{hash}/download") { |location| location }
      end

      #
      # Retrieve objects related to a file
      #
      # @see https://developers.virustotal.com/v3.0/reference#file_behaviours_pcap
      #
      # @param [String] id SHA-256, SHA-1 or MD5 identifying the file
      #
      # @return [Hash]
      #
      def pcap(id)
        _get("/file_behaviours/#{id}/pcap") { |raw| raw }
      end

      private

      def relationships
        @relationships ||= %w(
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
