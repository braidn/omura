# frozen_string_literal: true
#
# typed: false

require_relative '../spec_helper'

class BodyParamsTest < RequestTest
  let(:base_app) do
    Class.new(Hanami::API) do
      use BodyParamsValidator
      post '/api/products' do
        [201, { 'Content-Type' => 'application/hal+json' }, '']
      end
    end.new
  end
  let(:api) { Rack::MockRequest.new(base_app) }
  let(:params) do
    {
      _links: {},
      attributes: {
        name: 'OldGregg', description: 'The Locke Monster', active: true
      }
    }
  end
  let(:missing_params) do
    {
      name: 'OldGregg', description: 'The Locke Monster', active: true
    }
  end

  describe 'POST any resource' do
    describe 'succeeds' do
      it 'with a 201 due to the presence of attributes and resource keys' do
        req = api.post '/api/products', params: params
        _(req.status).must_equal 201
      end
    end
    describe 'fails' do
      it 'with a 400 due to missing params' do
        req = api.post '/api/products', params: missing_params

        _(req.status).must_equal 400
      end
    end
  end
end
