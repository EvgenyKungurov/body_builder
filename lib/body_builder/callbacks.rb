module BodyBuilder
  module Callbacks
    def before_action(callback, &block)
      send(callback)
      block.call if block
    end

  private

    def hello
      pust :Hello
    end

    def render_defult_template_for(*args)
      if args.include? :all
        @@callbacks[self.class.to_sym] = [:edit, :new, :index]
      else
        @@callbacks[self.class.to_sym] = []
        args.each { |el| @@callbacks[self.class.to_sym] << el.to_s }
      end
    end
  end
end
