class GroupsController < BodyBuilder::Controller

  def index
    @groups = Group.all
  end

  def new
    @notice = notice
  end

  def show
    @notice = notice
    @group = Group.find(params[:id])
  end

  def edit
     @notice = notice
     @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(strong_params)
      self.notice = "Данные пользователя обновлены"
      redirect_to @group
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    self.notice = "Пользователь #{@group.name} удален"
    redirect_to :index if @group.destroy
  end

  def create
    @group = Group.new(strong_params)
    if @group.save
      redirect_to :index
    else
      self.notice = "Что то пошло не так - #{@group.errors.messages}"
      redirect_to :new
    end
  end

  private

  def strong_params
    params[:group].permit(:name)
  end
end
