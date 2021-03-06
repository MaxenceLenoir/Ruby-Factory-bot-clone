module TinyFactory
  module Syntax
    module Methods
      def attributes_for(name)
        TinyFactory.attributes_for(name)
      end

      def build(name)
        TinyFactory.build(name)
      end

      def create(name)
        TinyFactory.create(name)
      end
    end
  end
end