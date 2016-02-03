class AdminController < BodyBuilder::Controller
  require_defult_template_for :all
  
  def index

  end

  def users
    @users = User.all
  end
end
