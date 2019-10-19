# frozen_string_literal: true

RSpec.describe VirusTotal::Client::URL, :vcr do
  include_context "client context"

  let(:id) { "http://example.com/" }

  include_examples "get example"
  include_examples "comments example"
  include_examples "relationships example"
  include_examples "votes example"

  describe "#analyse" do
    it do
      res = subject.analyse(id)
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
