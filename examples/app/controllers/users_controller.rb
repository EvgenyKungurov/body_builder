require File.expand_path('../../models/user', __FILE__)

class UsersController < BodyBuilder::Controller

  def index
    self.notice = "Проверка"
    @notice = notice
    @users  = User.all
  end

  def new
    @notice = notice
  end

  def show
    @notice = notice
    @user = User.find(params[:id])
  end

  def edit
     @notice = notice
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(strong_params)
      self.notice = "Данные пользователя обновлены"
      redirect_to :show
    else
      render :edit
    end
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

  def destroy
  	@user = User.find(params[:id])
    self.notice = "Пользователь #{@user.name} удален"
 		redirect_to :index if @user.destroy
  end

  private

  def strong_params
    params[:user].permit(:name)
  end
end
