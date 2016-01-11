# coding: utf-8
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'app', 'controllers')
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'app', 'models')

require 'body_builder'

module LiveQueue
  class Application < BodyBuilder::Application
  end
end
