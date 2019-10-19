# frozen_string_literal: true

RSpec.describe VirusTotal::Client::Graph, :vcr do
  include_context "client context"

  let(:id) { "g7bca5023c497475bbc737e8c29f32a0c3d7b9c5eb8af43bab7b59dd1f6f17e79" }

  include_examples "get example"
  include_examples "relationships example"

  describe "#search" do
    it do
      res = subject.search
      expect(res).to be_a(Hash)
    end
  end
end
