module Mongoid
  module Pinyin
    class Error < Exception
      def self.raise!(msg = nil, &cond)
        raise self.new(msg) if !cond || cond.call
      end
    end

    InvalidTypeError = Class.new(Error)
  end
end
