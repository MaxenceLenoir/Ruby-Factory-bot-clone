module TinyFactory
  class Strategy
    class AttributesFor
      def initialize(_)
        @result = {}
      end

      def get(attribute)
        @result[attribute]
      end

      def method_missing(attribute)
        get(attribute)
      end

      def set(attribute, value)
        @result[attribute] = value
      end

      def result
        @result
      end

      def add_to(strategy)
        # Not the final implementation
        strategy.set(@name, @definition.call)
      end
    end
  end
end