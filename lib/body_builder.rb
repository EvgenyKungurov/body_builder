require 'body_builder/version'
require 'body_builder/controller'
require 'body_builder/request_helper'
require 'body_builder/database_helper'
require 'body_builder/autoload'
require 'body_builder/context_helpers'
require 'body_builder/strong_params'
require 'body_builder/autoload'
require 'body_builder/context_helpers'
require "rails-erd/diagram/graphviz"

module BodyBuilder
  class Application
    def call(env)
      byebug
      BodyBuilder::DB.db_connect
      return [ 302, { 'Location' => '/admin/index' } ] if env['PATH_INFO'] == '/'
      return [ 500, {}, [] ] if env['PATH_INFO'] == 'favicon.ico'
      controller, @action = get_controller_and_action(env)
      @controller = controller.new(env)
      @controller.send(@action)
      @action = @controller.current_action if @controller.current_action
      send_route
    end

    private

    def send_route
      if @controller.redirection?
        @controller.send(@controller.redirect_path)
        [
          302,
          { 'Location' => "#{@controller.redirect_path}#{@controller.redirect_params}" },
          [@controller.render(@action)]
        ]
      else
        if @controller.execute_callbacks(@action)
          result = @controller.render_default_template { @controller.render(@action) }
          @controller.response(result, 200, headers = {'Content-Type' => 'text/html; charset=utf-8'})
        else
          result = @controller.render(@action)
          @controller.response(result, 200, headers = {'Content-Type' => 'text/html; charset=utf-8'})
        end
      end
    end

    def get_controller_and_action(env)
      _,controller, action = env["PATH_INFO"].split('/')
      controller = controller.to_camel_case + 'Controller'
      [Object.const_get(controller), action]
    end

    def self.version
      BobyBuilder::VERSION
    end
  end
end
