class String
  def to_camel_case
    self.split('_').map { |str| str.capitalize }.join
  end

  def to_snake_case
    self.split(/Controller$/).join.split(/(?=[A-Z])/).map(&:downcase).join('_') + '_controller'
  end
end
