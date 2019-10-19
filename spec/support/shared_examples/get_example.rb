# frozen_string_literal: true

RSpec.shared_examples "get example" do
  describe "#get" do
    it do
      res = subject.get(id)
      expect(res).to be_a(Hash)
    end
  end
end
