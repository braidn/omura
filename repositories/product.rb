# frozen_string_literal: true

#typed: true
class ProductRepository
  include Resources

  def get(id)
    products.select { |product| product[:id] == id }.first.tap do |product|
      product[:_links] = {self: {href: "/products/#{product[:id]}"}}
    end
  end
end
