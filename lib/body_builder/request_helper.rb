class String
  def to_camel_case
    self.split('_').map { |str| str.capitalize }.join
  end

  def to_snake_case
    self.split(/Controller$/).join.downcase + '_controller'   
  end
end
