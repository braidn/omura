# frozen_string_literal: true
# typed: false

require_relative '../spec_helper'

class ProductCreateTest < RequestTest
  describe "POST /api/v1/products" do
    let(:product_params) do
      {
        name: 'OldGregg',
        description: 'The Locke Monster',
        active: 'true'
      }
    end

    subject { app.post '/api/v1/products', product_params }

    it 'successfully sends a message to create a new product' do
      _(subject.status).must_equal 201
    end
  end
end
