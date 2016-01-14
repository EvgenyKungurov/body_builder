class LogsController < BodyBuilder::Controller

  def index
    @logs = Log.all
  end

  def new
    @notice = notice
  end

  def show
    @notice = notice
    @log = Log.find(params[:id])
  end

  def edit
     @notice = notice
     @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    if @log.update_attributes(strong_params)
      self.notice = "Данные пользователя обновлены"
      redirect_to @log
    else
      render :edit
    end
  end

  def destroy
    @log = Log.find(params[:id])
    self.notice = "Пользователь #{@log.name} удален"
    redirect_to :index if @log.destroy
  end

  def create
    @log = Log.new(strong_params)
    if @log.save
      redirect_to :index
    else
      self.notice = "Что то пошло не так - #{@log.errors.messages}"
      redirect_to :new
    end
  end

  private

  def strong_params
    params[:log].permit(:name)
  end
end
