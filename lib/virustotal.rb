# frozen_string_literal: true

require "virustotal/version"

require "virustotal/errors"

require "virustotal/api"

require "virustotal/clients/base"

require "virustotal/clients/modules/has_comments"
require "virustotal/clients/modules/has_get"
require "virustotal/clients/modules/has_relationships"
require "virustotal/clients/modules/has_votes"

require "virustotal/clients/analysis"
require "virustotal/clients/domain"
require "virustotal/clients/file"
require "virustotal/clients/ip_address"
require "virustotal/clients/url"

module VirusTotal
end
