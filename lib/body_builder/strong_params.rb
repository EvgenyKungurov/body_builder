class Hash
  def permit(*args)
    result = {}
    args.each { |k| result[k] = self.fetch(k.to_s) if self.key? k.to_s }
    result
  end
end
