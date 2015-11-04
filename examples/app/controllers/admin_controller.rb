class AdminController < BodyBuilder::Controller
	def index
		default_template { render(:index, name: 'Евгений', last_name: 'Кунгуров') }
	end
end