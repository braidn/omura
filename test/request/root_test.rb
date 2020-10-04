# typed: ignore
require_relative("../spec_helper")

class RootTest < RequestTest
  describe("#GET") do
    subject { get "/" }

    it("resolves with a success code") do
      _(subject.status).must_equal 302
    end
  end
end
