class Object
  def self.const_missing(const)
    require const.to_s.to_snake_case
    Dir['./app/models/*.rb'].each { |file| require file }
    Object.const_get(const)
  end
end
