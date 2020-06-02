# frozen_string_literal: true

# typed: ignore

require_relative '../../spec_helper'

class ProductRepositoryTest < UnitTest
  subject { ::ProductRepository.new }

  describe '#get' do
    let(:product) do
      { id: '123ME', name: 'Bilbo Baggins Bag-End', description: 'A Hovel' }
    end
    it 'returns a single product resource using a unique identifier' do
      _(subject.get(product[:id])).must_equal product
    end
  end
end
