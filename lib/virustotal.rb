# frozen_string_literal: true

require "virustotal/version"

require "virustotal/errors"

require "virustotal/api"

require "virustotal/clients/base"

require "virustotal/clients/actions/comments"
require "virustotal/clients/actions/get"
require "virustotal/clients/actions/relationships"
require "virustotal/clients/actions/votes"

require "virustotal/clients/analysis"
require "virustotal/clients/domain"
require "virustotal/clients/file"
require "virustotal/clients/ip_address"
require "virustotal/clients/url"

module VirusTotal
end
