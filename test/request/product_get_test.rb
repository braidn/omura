# frozen_string_literal: true
# typed: ignore

require_relative '../spec_helper'

class ProductGetTest < RequestTest
  describe 'GET /api/v1/product/:id' do
    describe 'success' do
      let(:ulid) { '123ME' }
      let(:product_get_route) { "/api/v1/product/#{ulid}" }

      let(:product_response) do
        {
          _links: { href: "api/v1/product/#{ulid}" },
          name: 'Old Gregg',
          description: 'Locke Monster',
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

      it 'returns a 200 response code' do
        res = get product_get_route

        _(res.status).must_equal 200
      end

      describe 'response serialization' do
        it 'returns a HAL serialized JSON that represents a product' do
          res = get product_get_route
          contract = ProductResponseContract.new.call(JSON.parse(res.body))

          _(contract.errors).must_be :empty?
        end
      end
    end
  end
end
