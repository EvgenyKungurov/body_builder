class UsersController < BodyBuilder::Controller

  def index
    @notice = notice
    @users = User.all
  end

  def new
    @notice = notice
    @groups = Group.all
  end

  def show
    @notice = notice
    @user = User.find(params[:id])
  end

  def edit
     @groups = Group.all
     @notice = notice
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(strong_params)
      self.notice = "Данные пользователя обновлены"
      redirect_to @user
    else
      @notice = "#{@user.errors.messages}___#{strong_params}__#{params}"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    self.notice = "Пользователь #{@user.name} удален"
    redirect_to :index if @user.destroy
  end

  def create
    @user = User.new(strong_params)
    if @user.save
      redirect_to :index
    else
      self.notice = "Что то пошло не так - #{@user.errors.messages}"
      render :new
    end
  end

  private

  def strong_params
    params[:user].permit(:name, :group_id)
  end

end
