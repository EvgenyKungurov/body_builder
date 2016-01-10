# coding: utf-8
require 'body_builder/version'
require 'body_builder/controller'
require 'body_builder/request_helper'
require 'body_builder/database_helper'
require 'body_builder/autoload'
require 'body_builder/context_helpers'
require 'body_builder/strong_params'

module BodyBuilder
  class Application
    def call(env)
      BodyBuilder::DB.db_connect
      return [ 302, { 'Location' => '/admin/index' }] if env['PATH_INFO'] == '/'
      return [ 500, {}, [] ] if env['PATH_INFO'] == 'favicon.ico'
      controller, action = get_controller_and_action(env)
      response = controller.new(env).send(action)
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
