module BodyBuilder
  class Router
    class << self

      def route
        @route = {}
      end

      def match(name, options = {}, &block)
        
      end

      def namespace(name, options = {}, &block)
        @name = name
      end

      def resource(name, options = {}, &block)
        @name = name
      end
    end
  end
end
