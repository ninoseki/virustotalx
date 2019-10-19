# frozen_string_literal: true

RSpec.shared_examples "votes example" do
  describe "#votes" do
    it do
      res = subject.votes(id)
      expect(res).to be_a(Hash)
    end
  end
end
