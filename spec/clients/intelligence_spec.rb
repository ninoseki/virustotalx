# frozen_string_literal: true

RSpec.describe VirusTotal::Client::Intelligence, :vcr do
  include_context "client context"

  describe "#search" do
    context "url search" do
      let(:query) { "entity:url hostname:example.com" }
      let(:cursor) { "eJwNyrEOgjAQANBfKqU1cWAwtpob7gjG0FxXSMTamxzACx8vw9tec7Ku8c6czZ40WtTosbzaPgxfuMKGOq1kx8oyfljwl1PcuFwcpUdFGTwVWCnMlXV-Z2E9eE5wPFroeat9iIZ1cmhp4cJK9yxQTbf_AS4YKAc=" }

      it do
        res = subject.search(query)
        expect(res).to be_a(Hash)
      end

      it do
        res = subject.search(query, cursor: cursor)
        expect(res).to be_a(Hash)
      end
    end

    context "file search" do
      let(:query) { "size:1KB- name:eicar type:text" }

      it do
        res = subject.search(query)
        expect(res).to be_a(Hash)
      end
    end
  end
end
