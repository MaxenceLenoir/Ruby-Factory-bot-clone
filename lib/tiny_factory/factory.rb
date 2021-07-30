module TinyFactory
  class Factory
    # A factory has a factory_name and holds the attributes
    attr_reader :factory_name

    def initialize(factory_name)
      @factory_name = factory_name
      @attributes = []
    end

    # Here comes the Attribute object!
    def add_attribute(name, definition)
      @attributes << Attribute.new(name, definition)
    end

    def method_missing(name, &block)
      add_attribute(name, block)
    end

    def run(strategy_class)
      strategy = strategy_class.new(build_class)
      @attributes.each do |attribute|
        attribute.add_to(strategy)
      end
      strategy.result
    end

    private

    def build_class
      # This is why we need ActiveSupport as a dependency.
      # `classify` and `constantize` are Active Support methods.
      factory_name.to_s.classify.constantize
    end
  end
end