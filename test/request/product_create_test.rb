# frozen_string_literal: true
# typed: false

require_relative '../spec_helper'

class ProductCreateTest < RequestTest
  describe 'POST /api/v1/products' do
    describe 'success' do
      let(:product_params) do
        {
          attributes: {
            name: 'OldGregg', description: 'The Locke Monster', active: true
          }
        }
      end
      let(:product_create_route) { '/api/v1/products' }

      it 'successfully sends a message to create a new product' do
        req = app.post product_create_route, params: product_params
        _(req.status).must_equal 201
      end
    end

    describe 'failure' do
      it 'responds with an error object' do
        req = app.post product_create_route, params: {}
      end
    end
  end
end
