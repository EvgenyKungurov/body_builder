$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'app', 'controllers')
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'app', 'models')

require 'body_builder'
require 'byebug'

module LiveQueue
  class Application < BodyBuilder::Application
  end
end
