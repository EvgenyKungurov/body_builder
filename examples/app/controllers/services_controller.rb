class ServicesController < BodyBuilder::Controller

  def index
    @services = Service.all.sort_by(&:name)
  end

  def new
    @notice = notice
  end

  def show
    @notice = notice
    @service = Service.find(params[:id])
  end

  def edit
     @notice = notice
     @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(strong_params)
      self.notice = "Данные пользователя обновлены"
      redirect_to @service
    else
      self.notice = "Были найдены ошибки: #{@service.errors.messages}"
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    self.notice = "Пользователь #{@service.name} удален"
    redirect_to :index if @service.destroy
  end

  def create
    @service = Service.new(strong_params)
    if @service.save
      redirect_to :index
    else
      self.notice = "Что то пошло не так - #{@service.errors.messages}"
      render :new
    end
  end

  private

  def strong_params
    params[:service].permit(:name, :world_of_alphabet)
  end
end
