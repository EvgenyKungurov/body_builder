class AdminController < BodyBuilder::Controller
  def index

  end

  def logs
    @clients = Client.all
    @count_day = 0
    Turn.select { |turn| turn.day == current_day }.map do |turn|
      turn.clients.each do |client|
        @count_day +=1
      end
    end
  end

  private

  def current_day
    Time.now.strftime "%Y-%m-%d"
  end
end
