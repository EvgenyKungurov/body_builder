class TurnsController < BodyBuilder::Controller
  attr_accessor :current_day

  def index
    @queue = Turn.all
  end

  def registration
    @services = Service.all.sort_by(&:name)
  end

  def add_to_turn
    @turn = Turn.find_or_initialize_by(strong_params.merge(current_day))
    if @turn.save
      add_client
      redirect_to :registration
    else
      self.notice = "Что то пошло не так - #{@turn.errors.messages}"
      render :new
    end
  end

  private

  def add_client
    @client = Client.new
    @client.turn_id = @turn.id
    client = Client.all.select { |client| client.turn_id == @turn.id.to_s }.last
    @client.symbol_name_turn = increment_number_turn(client)
    @client.save
  end

  def current_day
    time = Time.now.strftime "%Y-%m-%d"
    { day: time }
  end

  def increment_number_turn(client)
    service = Service.find(params[:turn]['service_id'])
    symbol_name = service.world_of_alphabet
    if client
      puts client.inspect
      "#{symbol_name}-#{client.symbol_name_turn.split('-').last.to_i + 1 }".to_sym
    else
      "#{symbol_name}-1".to_sym
    end
  end

  def strong_params
    params[:turn].permit(:service_id)
  end
end
