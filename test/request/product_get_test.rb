# frozen_string_literal: true
# typed: ignore

require_relative("../spec_helper")

class ProductGetTest < RequestTest
  describe("GET /api/v1/product/:id") do
    describe("success") do
      let(:ulid) { Stripe::Product.list.data.first.id }
      let(:product_route) { "/api/v1/product/#{ulid}" }

      let(:product_response) do
        {
          _links: {href: "api/v1/product/#{ulid}"},
          name: "Old Gregg",
          description: "Locke Monster",
          active: true
        }
      end

      it("returns a 200 response code") do
        res = get(product_route)

        _(res.status).must_equal 200
      end
    end
  end
end
