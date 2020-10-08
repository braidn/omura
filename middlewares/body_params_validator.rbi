# typed: strict

class Rack::Request
  sig {params(env: T.untyped).returns(T.self_type)}
  def initialize(env)
  end

  sig {returns T::Boolean}
  def post?
  end

  sig {returns T::Boolean}
  def patch?
  end

  sig {returns T::Boolean}
  def put?
  end

  sig {returns T::Hash[String, T.untyped]}
  def params
  end
end
