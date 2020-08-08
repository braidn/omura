# frozen_string_literal: true
# typed: ignore

require_relative("../spec_helper")

class ProductGetTest < RequestTest
  describe("GET /api/v1/product/:id") do
    describe("success") do
      let(:ulid) { "123ME" }
      let(:product) { Stripe::Product.create(name: 'Old Gregg', id: ulid) }
      let(:product_get_route) { "/api/v1/product/#{ulid}" }

      let(:product_response) do
        {
          _links: {href: "api/v1/product/#{ulid}"},
          name: "Old Gregg",
          description: "Locke Monster",
          active: true
        }
      end

      let(:listener) do
        Class.new do
          attr_accessor :product

          def initialize(response)
            @response = response
          end

          def on_product_requested(event)
            product = @response.merge(id: event[:id])
          end
        end.new(product_response)
      end

      it("returns a 200 response code") do
        binding.irb
        res = get(product_get_route)

        _(res.status).must_equal 200
      end
    end
  end
end
