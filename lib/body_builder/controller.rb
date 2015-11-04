require 'erubis'

module BodyBuilder
	class Controller
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