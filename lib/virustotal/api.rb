# frozen_string_literal: true

require_relative "clients/base"

module VirusTotal
  class API
    attr_reader :key

    def initialize(key: ENV["VIRUSTOTAL_API_KEY"])
      @key = key

      raise ArgumentError, "No API key has been found or provided! (setup your VIRUSTOTAL_API_KEY environment varialbe)" unless key
    end

    def analysis
      @analysis ||= Client::Analysis.new(key: key)
    end

    def domain
      @domain ||= Client::Domain.new(key: key)
    end

    def file
      @file ||= Client::File.new(key: key)
    end

    def ip_address
      @ip_address ||= Client::IPAddress.new(key: key)
    end

    def url
      @url ||= Client::URL.new(key: key)
    end
  end
end
