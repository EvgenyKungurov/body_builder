class ClientRestriction < ActiveRecord::Base
  def self.check_number_clients_per_day
    amount = ClientRestriction.find(name: 'Общее количество приема в день')
  end

  def self.check_number_internet_clients_per_day
    amount = ClientRestriction.find(name: 'Количество интернет записей в день')
  end

  def self.check_alternate_people
    amount = ClientRestriction.find(name: 'Очередность человек')
  end
end
