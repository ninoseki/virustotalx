# frozen_string_literal: true

require "virustotal/version"

require "virustotal/errors"

require "virustotal/api"

require "virustotal/clients/base"

require "virustotal/clients/domain"
require "virustotal/clients/file"
require "virustotal/clients/ip_address"
require "virustotal/clients/url"

module VirusTotal
  class Error < StandardError; end
end
