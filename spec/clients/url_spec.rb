# frozen_string_literal: true

RSpec.describe VirusTotal::Client::URL, :vcr do
  let(:id) { "http://example.com/" }

  include_examples "object example"

  describe "#analyse" do
    it do
      res = subject.analyse(id)
      expect(res).to be_a(Hash)
    end
  end

  describe "#votes" do
    it do
      res = subject.votes(id)
      expect(res).to be_a(Hash)
    end
  end

  describe "#network_location" do
    it do
      res = subject.network_location(id)
      expect(res).to be_a(Hash)
    end
  end

  describe "#network_location" do
    it do
      res = subject.network_location(id)
      expect(res).to be_a(Hash)
    end
  end
end
