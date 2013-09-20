module StringClusterer
  module Binning
    class Keyer
      attr_accessor :string

      def initialize(string)
        @string = string
      end

      def key
        raise NotImplementedError
      end
    end
  end
end
