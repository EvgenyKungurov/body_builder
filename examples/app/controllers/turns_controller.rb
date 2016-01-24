class TurnsController < BodyBuilder::Controller
  attr_accessor :current_day
  attr_accessor :internet_day

  def index
    @queue = Turn.all
  end

  def registration
    @services = Service.all.sort_by(&:name)
  end

  def internet_registration
    @notice = notice
    @services = Service.all.sort_by(&:name)
  end

  def add_to_turn
    @turn = Turn.find_or_initialize_by(strong_params.merge(current_day))
    @turn = Turn.find_or_initialize_by(strong_params.merge(internet_day)) if internet_entry?
    puts internet_entry?
    if @turn.save
      add_client(@turn)
      @services = registration
      self.notice = "Вы записались на #{params[:turn]}" if internet_entry?
      render :internet_registration if internet_entry?
      redirect_to :registration unless internet_entry?
    else
      self.notice = "Что то пошло не так - #{@turn.errors.messages}"
      render :new
    end
  end

  private

  def add_client(turn)
    @client = Client.new
    @client.turn_id = @turn.id
    client = Client.all.select { |client| client.turn_id == @turn.id.to_s }.last
    if internet_entry?
      @client.day = internet_day.values.last
      @client.hour = params[:turn]['hour']
      @client.minute = params[:turn]['minute']
    end
    @client.symbol_name_turn = increment_number_turn(client)
    @client.save
  end

  def current_day
    time = Time.now.strftime "%Y-%m-%d"
    { day: time }
  end

  def internet_day
    time = Time.now.strftime "%Y-%m-"
    time <<  params[:turn]['day']
    { day: time }
  end

  def increment_number_turn(client)
    service = Service.find(params[:turn]['service_id'])
    symbol_name = service.world_of_alphabet
    if client
      if internet_entry?
        "И#{symbol_name}-#{client.symbol_name_turn.split('-').last.to_i + 1 }".to_sym
      else
        "#{symbol_name}-#{client.symbol_name_turn.split('-').last.to_i + 1 }".to_sym
      end
    else
      if internet_entry?
        "И#{symbol_name}-1".to_sym
      else
        "#{symbol_name}-1".to_sym
      end
    end
  end

  def internet_entry?
    params[:turn].key? 'internet_entry'
  end

  def strong_params
    params[:turn].permit(:service_id)
  end
end
