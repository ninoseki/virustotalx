# frozen_string_literal: true

require "json"
require "net/https"
require "uri"

module VirusTotal
  module Client
    class Base
      HOST = "www.virustotal.com"
      VERSION = "v2"
      BASE_URL = "https://#{HOST}/vtapi/#{VERSION}"

      attr_reader :key

      def initialize(key: ENV["VIRUSTOTAL_API_KEY"])
        @key = key
        raise ArgumentError, "No key has been found or provided!" unless key?
      end

      private

      def key?
        !key.nil?
      end

      def default_params
        { apikey: key }
      end

      def url_for(path)
        URI(BASE_URL + path)
      end

      def https_options
        if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
          uri = URI(proxy)
          {
            proxy_address: uri.hostname,
            proxy_port: uri.port,
            proxy_from_env: false,
            use_ssl: true
          }
        else
          { use_ssl: true }
        end
      end

      def request(req)
        Net::HTTP.start(HOST, 443, https_options) do |http|
          response = http.request(req)

          case response.code
          when "200"
            if response["Content-Type"] == "application/json"
              yield JSON.parse(response.body)
            else
              yield response.body
            end
          when "204"
            raise(RateLimitError, response.body)
          when "302"
            yield response["Location"]
          else
            raise(Error, "unsupported response code returned: #{response.code}")
          end
        end
      end

      def get(path, params = {}, &block)
        uri = url_for(path)
        uri.query = URI.encode_www_form(params.merge(default_params))
        get = Net::HTTP::Get.new(uri)

        request(get, &block)
      end

      def post(path, params = {}, &block)
        post = Net::HTTP::Post.new(url_for(path))
        post.set_form_data params.merge(default_params)

        request(post, &block)
      end

      def post_with_file(path, file:, filename:, &block)
        post = Net::HTTP::Post.new(url_for(path))

        data = [
          ["file", file, { "filename": filename }],
          ["apikey", key]
        ]
        post.set_form(data, "multipart/form-data")

        request(post, &block)
      end
    end
  end
end
