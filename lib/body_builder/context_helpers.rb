require 'body_builder/helpers/render'

module Erubis
  class Context
    include BodyBuilder::Helpers
  end

  class Eruby
    include BodyBuilder::Helpers
  end
end
