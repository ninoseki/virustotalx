# frozen_string_literal: true

RSpec.describe VirusTotal::Client::Domain, :vcr do
  include_context "client context"

  let(:id) { "github.com" }

  include_examples "get example"
  include_examples "comments example"
  include_examples "relationships example"
end
