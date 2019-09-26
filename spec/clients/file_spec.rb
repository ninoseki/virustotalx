# frozen_string_literal: true

require "date"

RSpec.describe VirusTotal::Client::File, :vcr do
  let(:id) { "275a021bbfb6489e54d471899f7db9d1663fc695ec2fe2a2c4538aabf651fd0f" }

  describe "#upload" do
    let(:path) { File.expand_path("../fixtures/test.txt", __dir__) }

    it do
      res = subject.upload(path)
      expect(res).to be_a(Hash)
    end
  end

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

  describe "#upload_url" do
    it do
      res = subject.upload_url
      expect(res).to be_a(Hash)
    end
  end

  describe "#download" do
    it do
      res = subject.download(id)
      expect(res).to be_a(String)
    end
  end

  describe "#add_vote" do
    it do
      res = subject.add_vote(id, "harmless")
      expect(res).to be_a(Hash)
    end
  end

  describe "#download_url" do
    it do
      res = subject.download_url(id)
      expect(res).to be_a(Hash)
    end
  end
end
