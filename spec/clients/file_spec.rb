# frozen_string_literal: true

require "date"

RSpec.describe VirusTotal::Client::File, :vcr do
  let(:api ) { VirusTotal::API.new }
  let(:hash) { "726a2eedb9df3d63ec1b4a7d774a799901f1a2b9" }

  describe "#report" do
    it do
      res = api.file.report(hash)
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
      res = api.file.rescan(hash)
      expect(res).to be_a(Hash)
    end
  end

  describe "#upload_url" do
    it do
      res = api.file.upload_url
      expect(res).to be_a(String)
    end
  end

  describe "#download" do
    it do
      res = api.file.download(hash)
      expect(res).to be_a(String)
    end
  end

  describe "#behaviour" do
    it do
      res = api.file.behaviour(hash)
      expect(res).to be_a(Hash)
    end
  end

  describe "#network_traffic" do
    it do
      res = api.file.network_traffic(hash)
      expect(res).to be_a(Hash)
    end
  end

  describe "#clusters" do
    let(:date) { "2019-052T" }

    it do
      res = api.file.clusters(date)
      expect(res).to be_a(Hash)
    end
  end

  describe "#search" do
    let(:query) { "resource:#{hash}" }

    it do
      res = api.file.search(query)
      expect(res).to be_a(Hash)
    end
  end
end
