# frozen_string_literal: true

RELATIONSHIPS = %w[
  analyses
  behaviours
  bundled_files
  carbonblack_children
  carbonblack_parents
  comments
  communicating_files
  compressed_parents
  contacted_domains
  contacted_ips
  contacted_urls
  downloaded_files
  editors
  email_parents
  embedded_domains
  embedded_ips
  execution_parents
  graphs
  group
  historical_whois
  items
  itw_urls
  last_serving_ip_address
  overlay_parents
  owner
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
  viewers
  votes
].map(&:to_sym)

RSpec.shared_examples "relationships example" do
  klass_instance = described_class.new

  context "with relationships" do
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
