# typed: strong
#
module Concurrent
  class Map
    sig {params(key: Symbol, val: T.any()).void}
    def []=(key, val); end
  end
end
