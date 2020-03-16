# frozen_string_literal: true
# typed: true
require 'dry/events/publisher'

class ProductPublisher
  include Dry::Events::Publisher[:product_publisher]

  register_event('product.created')
end
