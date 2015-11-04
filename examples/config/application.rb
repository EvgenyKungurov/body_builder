# coding: utf-8
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'app', 'controllers')

require 'body_builder'

module Esrc
  class Application < BodyBuilder::Application
  end
end