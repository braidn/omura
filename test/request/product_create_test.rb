# frozen_string_literal: true
# typed: ignore

require_relative("../spec_helper")

class ProductCreateTest < RequestTest
  describe("POST /api/v1/products") do
    describe("success") do
      let(:product_params) do
        {
          _links: {type: {href: "/api/v1/products"}},
          attributes: {
            name: "OldGregg",
            description: "The Locke Monster",
            active: true
          }
        }
      end

      let(:product_create_route) { "/api/v1/products" }

      it("successfully sends a message to create a new product") do
        req = post(product_create_route, product_params)
        _(req.status).must_equal 201
      end

      it("sends the location of the new object for retrieval") do
        req = post(product_create_route, product_params)
        _(req.headers["Location"]).must_match %r{\/api\/v1\/product\/\S+}
      end
    end
  end
end
