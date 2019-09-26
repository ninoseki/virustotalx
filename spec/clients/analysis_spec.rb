# frozen_string_literal: true

RSpec.describe VirusTotal::Client::Analysis, :vcr do
  subject { described_class.new }

  let(:id) { "u-2a1b402420ef46577471cdc7409b0fa2c6a204db316e59ade2d805435489a067-1569484202" }

  describe "#get" do
    it do
      res = subject.get(id)
      expect(res).to be_a(Hash)
    end
  end
end
