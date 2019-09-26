# frozen_string_literal: true

RSpec.describe VirusTotal::Client::Domain, :vcr do
  let(:id) { "github.com" }

  include_examples "object example"
end
