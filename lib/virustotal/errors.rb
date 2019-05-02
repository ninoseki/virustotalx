# frozen_string_literal: true

module VirusTotal
  class Error < StandardError; end
  class RateLimitError < Error; end
end
