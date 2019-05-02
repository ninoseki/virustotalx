# frozen_string_literal: true

RSpec.describe VirusTotal::Client::File, :vcr do
  let(:api ) { VirusTotal::API.new }

  describe "#report" do
    it do
      res = api.file.report("7657fcb7d772448a6d8504e4b20168b8")
      expect(res).to be_a(Hash)
    end
  end

  describe "#scan" do
    let(:path) { File.expand_path("../fixtures/test.txt", __dir__) }

    it do
      res = api.file.scan(path)
      expect(res).to be_a(Hash)
    end
  end

  describe "#rescan" do
    it do
      res = api.file.rescan("7657fcb7d772448a6d8504e4b20168b8")
      expect(res).to be_a(Hash)
    end
  end
end
