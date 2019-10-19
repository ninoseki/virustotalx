# frozen_string_literal: true

require "base64"

module VirusTotal
  module Client
    class URL < Object
      #
      # Analyse an URL.
      #
      # @see https://developers.virustotal.com/v3.0/reference#urls-analyse
      #
      # @param [String] url URL identifier
      #
      # @return [Hash]
      #
      def analyse(url)
        id = to_id(url)
        _post("/urls/#{id}/analyse") { |json| json }
      end

      #
      # Retrieve votes for a URL
      #
      # @see https://developers.virustotal.com/v3.0/reference#urls-votes-get
      #
      # @param [String] url URL identifier
      #
      # @return [Hash]
      #
      def votes(url)
        id = to_id(url)
        _get("/urls/#{id}/votes") { |json| json }
      end

      #
      # Domain or IP address for a URL.
      #
      # @see https://developers.virustotal.com/v3.0/reference#urlsidnetwork_location
      #
      # @param [String] url URL identifier
      #
      # @return [Hash]
      #
      def network_location(url)
        id = to_id(url)
        _get("/urls/#{id}/network_location") { |json| json }
      end

      #
      # Add a vote for a URL
      #
      # @see https://developers.virustotal.com/v3.0/reference#urls-votes-post
      #
      # @param [String] url URL identifier
      # @param [String] verdict harmless or malicious
      #
      # @return [Hash]
      #
      def add_vote(url, verdict)
        id = to_id(url)
        params = {
          data: {
            type: "vote",
            attributes: {
              verdict: verdict
            }
          }
        }
        _post("/urls/#{id}/votes", params) { |json| json }
      end

      private

      def to_id(url)
        Base64.urlsafe_encode64(url).split("=").first
      end

      def relationships
        %w(
          analyses
          downloaded_files
          graphs
          last_serving_ip_address
          redirecting_urls
          submissions
        ).map(&:to_sym)
      end
    end
  end
end
