# frozen_string_literal: true

RSpec.describe VirusTotal::Client::IPAddress, :vcr do
  let(:id) { "1.1.1.1" }

  include_examples "object example"
end
