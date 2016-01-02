class AdminController < BodyBuilder::Controller
  def index
    default_template { render(:index, name: 'Евгений', last_name: 'Кунгуров') }
  end

  def who_is
    render :who_is, name: params['name']
  end
end
