# frozen_string_literal: true

RSpec.describe VirusTotal::Client::URL, :vcr do
  let(:api ) { VirusTotal::API.new }

  describe "#report" do
    it do
      res = api.url.report("http://github.com")
      expect(res).to be_a(Hash)
    end
  end

  describe "#scan" do
    it do
      res = api.url.scan("https://github.com/ninoseki/virustotalx")
      expect(res).to be_a(Hash)
    end
  end
end
