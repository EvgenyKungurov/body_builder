class Hash
  def permit(*args)
    self.reject { |k, v| args.any? { |v| v.to_s != k } }
  end
end
