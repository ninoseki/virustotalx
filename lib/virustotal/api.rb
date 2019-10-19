# frozen_string_literal: true

module VirusTotal
  class API
    # @return [String] VirusTotal API key
    attr_reader :key

    #
    # @param [String] key VirusTotal API key
    #
    # @raise [ArgumentError] When given an empty key
    #
    def initialize(key: ENV["VIRUSTOTAL_API_KEY"])
      @key = key

      raise ArgumentError, "No API key has been found or provided! (setup your VIRUSTOTAL_API_KEY environment varialbe)" unless key
    end

    #
    # Analyses API endpoint client
    #
    # @return [VirusTotal::Client::Analysis]
    #
    def analysis
      @analysis ||= Client::Analysis.new(key: key)
    end

    #
    # Domains API endpoint client
    #
    # @return [VirusTotal::Client::Domain]
    #
    def domain
      @domain ||= Client::Domain.new(key: key)
    end

    #
    # Files API endpoint client
    #
    # @return [VirusTotal::Client::File]
    #
    def file
      @file ||= Client::File.new(key: key)
    end

    #
    # IP addresses API endpoint client
    #
    # @return [VirusTotal::Client::IPAddress]
    #
    def ip_address
      @ip_address ||= Client::IPAddress.new(key: key)
    end

    #
    # URLs API endpoint client
    #
    # @return [VirusTotal::Client::URL]
    #
    def url
      @url ||= Client::URL.new(key: key)
    end
  end
end
