require 'erubis'
require 'body_builder/action_notice'

module BodyBuilder
  class Controller
    include BodyBuilder::ActionNotice
    attr_accessor :current_action
    attr_reader :request

    def initialize(env)
      @request ||= Rack::Request.new(env)
    end

    def params
      request.params.symbolize_keys
    end

    def response(body, status = 200, headers = {})
      @response ||= Rack::Response.new(body, status, headers)
    end

    def redirection?
      @redirect != nil
    end

    def redirect_path
      @redirect
    end

    def redirect_params
      @params
    end

    def redirect_to(arg)
      case arg
      when Symbol
        @redirect = arg.to_s
        self.current_action = @redirect
      else
        @params = "?id=#{arg.id}"
        @redirect = "show"
        self.current_action = @redirect
      end
    end

    def render(views_action)
      self.current_action = views_action
      template = File.read(File.join('app', 'views', controller_name, "#{views_action}.html.erb"))
      Erubis::Eruby.new(template).result(instance_variables_hash)
    end

    def default_template(&block)
      template = File.read(File.join('public', 'application.html.erb'))
      Erubis::Eruby.new(template).evaluate(&block)
    end

    private

    def instance_variables_hash
      hash = {}
      instance_variables.each do |instance|
        hash[instance.to_s.gsub('@', '').to_sym] = instance_variable_get(instance)
      end
      hash
    end

    def symbolize_keys
      result = {}
      self.each { |k, v| result[k.to_sym] = v }
      result
    end

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").downcase
    end
  end
end
