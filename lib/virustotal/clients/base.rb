# frozen_string_literal: true

require "json"
require "net/https"
require "uri"

module VirusTotal
  module Client
    class Base
      HOST = "www.virustotal.com"
      VERSION = "v3"
      BASE_URL = "https://#{HOST}/api/#{VERSION}"

      CONVERT_TABLE = {
        analysis: "analyses",
        domain: "domains",
        file: "files",
        ipaddress: "ip_addresses",
        url: "urls",
      }.freeze

      attr_reader :key

      def initialize(key: ENV["VIRUSTOTAL_API_KEY"])
        @key = key
        raise ArgumentError, "No key has been found or provided!" unless key?
      end

      private

      def key?
        !key.nil?
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

      def raise_error(code, message)
        code = code.to_s.to_sym

        table = {
          "400": BadRequestError,
          "401": AuthenticationRequiredError,
          "403": ForbiddenError,
          "404": NotFoundError,
          "409": AlreadyExistsError,
          "429": QuotaExceededError,
          "503": TransientError,
        }
        raise Error, "Unsupported response code returned: #{code} - #{message}" unless table.key?(code)

        klass = table[code]
        raise klass, message
      end

      def request(req)
        Net::HTTP.start(HOST, 443, https_options) do |http|
          req["x-apikey"] = key

          response = http.request(req)

          code = response.code.to_i
          body = response.body
          json = JSON.parse(body) if response["Content-Type"].to_s.include?("application/json")
          message = json ? json.dig("message") : body

          case code
          when 200
            if json
              yield json
            else
              yield body
            end
          when 302
            yield response["Location"]
          else
            raise_error code, message
          end
        end
      end

      def _get(path, params = {}, &block)
        uri = url_for(path)
        uri.query = URI.encode_www_form(params)
        get = Net::HTTP::Get.new(uri)

        request(get, &block)
      end

      def _post(path, params = {}, &block)
        post = Net::HTTP::Post.new(url_for(path))
        post.body = JSON.generate(params)

        request(post, &block)
      end

      def _post_with_file(path, file:, filename:, &block)
        post = Net::HTTP::Post.new(url_for(path))

        data = [
          ["file", file, { "filename": filename }],
        ]
        post.set_form(data, "multipart/form-data")

        request(post, &block)
      end

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
