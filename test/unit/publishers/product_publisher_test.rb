# frozen_string_literal: true

# typed: ignore

require_relative '../../spec_helper'

class ProductPublisherTest < UnitTest
  describe '#create' do
    subject { ::ProductPublisher.new }

    it 'emits the create product event' do
      skip
      params = { name: 'OldGregg', description: 'The Locke' }
      event_data = {}
      subject.subscribe('product.created') do |event|
        event_data = event[:product]
      end

      subject.publish('product.created', product: params)

      _(event_data).must_equal params
    end

    it 'emits the product requested event' do
      skip
      params = { id: '123ME' }
      event_data = {}
      subject.subscribe('product.requested') do |event|
        event_data = event[:product]
      end

      subject.publish('product.requested', product: params)

      _(event_data).must_equal params
    end
  end
end
