# frozen_string_literal: true

# typed: ignore
require_relative("../../spec_helper")

class ProductRepositoryTest < UnitTest
  subject { ::ProductRepository.new }

  describe("#get") do
    let(:id) { "prod_#{ULID.generate}" }
    let(:_links) {  {:self => {:href => "/products/#{id}"}} }

    before do
      resource_helper.create_product(id: id, name: "Bilbo Baggins")
    end

    it("returns a single product resource using a unique identifier") do
      _(subject.get(id)[:_links].to_hash).must_equal _links
    end
  end
end
