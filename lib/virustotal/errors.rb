# frozen_string_literal: true

module VirusTotal
  class Error < StandardError; end

  class AlreadyExistsError < Error; end

  class AuthenticationRequiredError < Error; end

  class BadRequestError < Error; end

  class ForbiddenError < Error; end

  class InvalidArgumentError < Error; end

  class NotFoundError < Error; end

  class QuotaExceededError < Error; end

  class RateLimitError < Error; end

  class TooManyRequestsError < Error; end

  class TransientError < Error; end

  class UserNotActiveError < Error; end

  class WrongCredentialsError < Error; end
end
