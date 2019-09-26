# frozen_string_literal: true

RSpec.shared_examples "object example" do
  subject { described_class.new }

  RELATIONSHIPS = %w(
    analyses
    behaviours
    bundled_files
    carbonblack_children
    carbonblack_parents
    communicating_files
    compressed_parents
    contacted_domains
    contacted_ips
    contacted_urls
    downloaded_files
    email_parents
    embedded_domains
    embedded_ips
    execution_parents
    graphs
    historical_whois
    itw_urls
    last_serving_ip_address
    overlay_parents
    pcap_parents
    pe_resource_parents
    redirecting_urls
    referrer_files
    resolutions
    screenshots
    siblings
    similar_files
    submissions
    urls
    votes
  ).map(&:to_sym)

  klass_instance = described_class.new

  describe "#get" do
    it do
      res = subject.get(id)
      expect(res).to be_a(Hash)
    end
  end

  describe "#comments" do
    it do
      res = subject.comments(id)
      expect(res).to be_a(Hash)
    end
  end

  context "with repationships" do
    RELATIONSHIPS.each do |relationship|
      next unless klass_instance.respond_to?(relationship)

      describe relationship.to_s do
        it do
          res = subject.send(relationship, id)
          expect(res).to be_a(Hash)
        end
      end
    end
  end
end
