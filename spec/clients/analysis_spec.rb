# frozen_string_literal: true

RSpec.describe VirusTotal::Client::Analysis, :vcr do
  include_context "client context"

  let(:id) { "u-2a1b402420ef46577471cdc7409b0fa2c6a204db316e59ade2d805435489a067-1569484202" }

  include_examples "get example"
end
