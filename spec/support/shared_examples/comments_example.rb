# frozen_string_literal: true

RSpec.shared_examples "comments example" do
  describe "#comments" do
    it do
      res = subject.comments(id)
      expect(res).to be_a(Hash)
    end
  end
end
