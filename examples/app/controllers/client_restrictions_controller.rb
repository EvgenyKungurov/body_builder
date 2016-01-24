class ClientRestrictionsController < BodyBuilder::Controller
  def index
    @restrictions = ClientRestriction.all
  end

  def new
    @notice = notice
  end

  def edit
    @notice = notice
    @restriction = ClientRestriction.find(params[:id])
  end

  def create
    @restriction = ClientRestriction.new(strong_params)
    if @restriction.save
      redirect_to :index
    else
      self.notice = "Что то пошло не так - #{@restriction.errors.messages}"
      render :new
    end
  end

  def update
    @restriction = ClientRestriction.find(params[:id])
    if @restriction.update_attributes(strong_params)
      self.notice = "Данные обновлены"
      redirect_to :index
    else
      @notice = "#{@restriction.errors.messages}_#{strong_params}__#{params}"
      render :edit
    end
  end

  def strong_params
    params[:client_restriction].permit(:name, :count)
  end
end
