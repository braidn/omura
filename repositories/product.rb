# frozen_string_literal: true

#typed: true
PRODUCTS = [
  {
    id: '123ME',
    name: 'Bilbo Baggins Bag-End',
    description: 'A Hovel',
    active: true
  }
]

class ProductRepository
  def get(id)
    PRODUCTS.select { |product| product[:id] == id }.first.tap do |product|
      product[:_links] = { self: { href: "/products/#{product[:id]}" } }
    end
  end
end
