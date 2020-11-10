# typed: strict

class Stripe
  sig { params(key: String).void }
  def self.api_key=(key)
  end
end

class Stripe::StripeObject
  sig {params(key: String).void}
  def api_key=(key)
  end
end

class Stripe::Product
  sig { returns(ProductList)}
  def self.list
  end
end


class ProductList
  sig { returns(T::Array[Product]) }
  def data
  end
end
