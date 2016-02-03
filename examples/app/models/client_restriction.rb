class ClientRestriction < ActiveRecord::Base

  def self.max_internet_clients_per_day(internet_day)
    internet_clients = 0
    Turn.select { |turn| turn.day == internet_day }.each do |turn|
      turn.clients.each do |client|
        internet_clients += 1 if client.symbol_name_turn.include? 'И'
      end
    end
    internet_clients >= number_internet_clients_per_day.to_i
  end

  def self.max_clients_per_day(current_day)
    clients = 0
    Turn.select { |turn| turn.day == current_day }.each do |turn|
      turn.clients.each do |client|
        clients += 1 if client
      end
    end
    clients >= number_clients_per_day.to_i
  end

  private

  def self.number_clients_per_day
    ClientRestriction.find_by(name: 'Общее количество приема в день').count
  end

  def self.number_internet_clients_per_day
    ClientRestriction.find_by(name: 'Количество интернет записей в день').count
  end

  def self.alternate_people
    ClientRestriction.find_by(name: 'Очередность человек').count
  end

end
