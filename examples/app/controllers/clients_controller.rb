class ClientsController < BodyBuilder::Controller
  def index
    @users = User.select { |user| user.group_id == '2' }
    @notice = notice
    @clients = Client.select { |client| client.turn.day == current_day }

    @count_turn = 0
    @count_day = 0
    Turn.select { |turn| turn.day == current_day }.map do |turn|
      turn.clients.each do |client|
        @count_turn +=1 if client.status == nil
        @count_day +=1
      end
    end
  end

  def get_clients
    @clients = Client.all
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(strong_params)
      self.notice = "Данные пользователя обновлены"
      redirect_to @client
    else
      @notice = "#{@client.errors.messages}___#{strong_params}__#{params}"
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    self.notice = "Пользователь #{@client.name} удален"
    redirect_to :index if @client.destroy
  end

  def create
    @client = Client.new(strong_params)
    if @client.save
      redirect_to :index
    else
      self.notice = "Что то пошло не так - #{@client.errors.messages}"
      render :new
    end
  end

  private

  def current_day
    Time.now.strftime "%Y-%m-%d"
  end

  def strong_params
    params[:client].permit(:status, :user_id, :recorded_on, :symbol_name_turn, :turn_id)
  end
end
