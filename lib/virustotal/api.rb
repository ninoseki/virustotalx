# frozen_string_literal: true

require_relative "clients/base"

module VirusTotal
  class API
    attr_reader :domain
    attr_reader :file
    attr_reader :ip_address
    attr_reader :url

    def initialize(key: ENV["VIRUSTOTAL_API_KEY"])
      raise ArgumentError, "No API key has been found or provided! (setup your VIRUSTOTAL_API_KEY environment varialbe)" unless key

      @domain = Client::Domain.new(key: key)
      @file = Client::File.new(key: key)
      @ip_address = Client::IPAddress.new(key: key)
      @url = Client::URL.new(key: key)
    end
  end
end
