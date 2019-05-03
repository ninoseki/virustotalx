# frozen_string_literal: true

RSpec.describe VirusTotal::Client::Domain, :vcr do
  let(:api ) { VirusTotal::API.new }

  describe "#report" do
    it do
      res = api.domain.report("github.com")
      expect(res).to be_a(Hash)
    end

    context "with non existing resource" do
      it do
        res = api.domain.report("a_domain_which_does_not_exist.co.jp")
        expect(res).to eq(nil)
      end
    end
  end
end
