# coding: utf-8
require 'body_builder/version'
require 'body_builder/controller'
require 'body_builder/request_helper'
require 'body_builder/autoload'
require 'body_builder/context_helpers'

module BodyBuilder
  class Application
    def call(env)
      controller, action = get_controller_and_action(env)
      response = controller.new.send(action)
      [ 200, { 'Content-Type' => 'text/html; charset=utf-8' }, [response] ]
    end

    private

    def get_controller_and_action(env)
      _,controller, action = env["PATH_INFO"].split('/')
      controller = controller.to_camel_case + 'Controller'
      [Object.const_get(controller), action]
    end
  end
  
  def self.version
    BobyBuilder::VERSION
  end
end
