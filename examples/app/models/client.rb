class Client < ActiveRecord::Base

  belongs_to :user
  belongs_to :turn
  validates :day, uniqueness: { scope: [:minute, :hour],
     message: "Данное время уже занято, выберите другое" }, allow_nil: true
  validate :max_clients_per_day

  def max_clients_per_day
    if internet_entry?
      if ClientRestriction.max_internet_clients_per_day(internet_day)
        errors.add(:notice, 'Интернет запись на этот день закончена')
      end
    else
      if ClientRestriction.max_clients_per_day(current_day)
        errors.add(:notice, "На сегодня запись окончена")
      end
    end
  end

  private

  def current_day
    Time.now.strftime "%Y-%m-%d"
  end

  def internet_day
    time = Time.now.strftime "%Y-%m-"
    time <<  self.day.split('-').last if self.day
  end

  def internet_entry?
    self.day
  end

end
