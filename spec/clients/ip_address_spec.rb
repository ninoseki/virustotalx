# frozen_string_literal: true

RSpec.describe VirusTotal::Client::IPAddress, :vcr do
  include_context "client context"

  let(:id) { "1.1.1.1" }

  include_examples "get example"
  include_examples "comments example"
  include_examples "relationships example"
end
