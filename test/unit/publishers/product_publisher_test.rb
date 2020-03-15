# frozen_string_literal: true
# typed: false

require_relative '../../spec_helper'

class ProductPublisherTest < UnitTest
  describe '#create' do
    subject { ::ProductPublisher.new }

    it 'emits the create product event' do
      params = { name: 'OldGregg', description: 'The Locke' }
      event_data = {}
      subject.subscribe('product.created') do |event|
        event_data = event[:product]
      end

      subject.publish('product.created', product: params)


      _(event_data).must_equal params
    end
  end
end
