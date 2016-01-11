require 'erubis'
<<<<<<< HEAD
require 'body_builder/action_notice'

module BodyBuilder
  class Controller
    include BodyBuilder::ActionNotice

=======

module BodyBuilder
  class Controller
>>>>>>> 384f7320b0d5e76cb77f892ee5632e21e00535e0
    attr_reader :request

    def initialize(env)
      @request ||= Rack::Request.new(env)
    end

    def params
      request.params
    end

    def response
<<<<<<< HEAD

    end

    def redirect_to(action, args = nil)
      self.send(action)
=======
      
>>>>>>> 384f7320b0d5e76cb77f892ee5632e21e00535e0
    end

    def render(views_action, options = {})
      template = File.read(File.join('app', 'views', controller_name, "#{views_action}.html.erb"))
      Erubis::Eruby.new(template).result(options)
    end

    def default_template(&block)
      template = File.read(File.join('public', 'application.html.erb'))
      Erubis::Eruby.new(template).evaluate(&block)
    end

    private

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").downcase
    end
  end
end
