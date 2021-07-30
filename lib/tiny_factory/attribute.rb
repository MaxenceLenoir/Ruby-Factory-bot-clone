module TinyFactory
  class Attribute
    def initialize(name, definition)
      @name = name.to_sym
      @definition = definition
    end

    def add_to(strategy)
      strategy.set(@name, strategy.instance_eval(&@definition))
    end
  end
end