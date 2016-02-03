class ClientsController < BodyBuilder::Controller
  def index
    @users = Group.find(2).users
    @notice = notice
    @clients = Client.all
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

  def strong_params
    params[:client].permit(:status, :user_id, :recorded_on, :symbol_name_turn, :turn_id)
  end
end
