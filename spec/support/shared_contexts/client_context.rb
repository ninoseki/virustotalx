# frozen_string_literal: true

RSpec.shared_context "client context", shared_context: :metadata do
  subject { described_class.new }
end
