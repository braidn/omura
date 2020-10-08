# frozen_string_literal: true

# typed: ignore
require_relative("../../spec_helper")

class ProductRepositoryTest < UnitTest
  subject { ::ProductRepository.new }

  describe("#get") do
    let(:ulid) { Stripe::Product.list.data.first.id }
    let(:_links) { {:self => {:href => "/products/#{ulid}"}} }

    it("returns a single product resource using a unique identifier") do
      _(subject.get(ulid).keys).must_include :id
    end
  end
end
