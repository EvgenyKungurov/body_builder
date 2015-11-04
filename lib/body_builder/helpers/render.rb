module BodyBuilder
  module Helpers
    def render(name)
      template = File.read(File.join('app', 'views', 'layouts', "_#{name}.html.erb"))
      Erubis::Eruby.new(template).result
    end
  end
end