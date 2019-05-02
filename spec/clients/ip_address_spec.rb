# frozen_string_literal: true

RSpec.describe VirusTotal::Client::IPAddress, :vcr do
  let(:api ) { VirusTotal::API.new }

  describe "#report" do
    it do
      res = api.ip_address.report("1.1.1.1")
      expect(res).to be_a(Hash)
    end
  end
end
