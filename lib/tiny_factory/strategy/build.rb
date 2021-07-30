module TinyFactory
  class Strategy
    class Build
      # One small difference here, the strategy needs to be
      # initialized with a class. In our example, as we are building
      # a User instance, our build strategy will be initialized with the
      # User class.
      def initialize(klass)
        @instance = klass.new
      end

      def get(attribute)
        @instance.send(attribute)
      end

      def set(attribute, value)
        @instance.send("#{attribute}=", value)
      end

      def method_missing(attribute)
        get(attribute)
      end

      def result
        @instance
      end
    end
  end
end