class TurnsController < BodyBuilder::Controller

  def index
    @queue = Turn.all
    @services = Service.all.sort_by(&:name)
  end

  def registration
    @services = Service.all.sort_by(&:name)
  end

  def add_to_queue
    redirect_to :registration
  end

  private

  def strong_params
    params[:turn].permit(:name)
  end

end
