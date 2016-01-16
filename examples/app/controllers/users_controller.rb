class UsersController < BodyBuilder::Controller

  def index
    render :index, users: User.all
  end

  def new
    render :new, notice: notice
  end

  def create
    @user = User.new(strong_params)
    if @user.save
      redirect_to :index
    else
      self.notice = "Что то пошло не так - #{@user.errors.messages}"
      redirect_to :new
    end
  end

  private

  def strong_params
    params["user"].permit(:name)
  end
end
