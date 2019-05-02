# frozen_string_literal: true

RSpec.describe VirusTotal::Client::Domain, :vcr do
  let(:api ) { VirusTotal::API.new }

  describe "#report" do
    it do
      res = api.domain.report("github.com")
      expect(res).to be_a(Hash)
    end
  end
end
