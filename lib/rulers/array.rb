class Array
  def average
    sum.to_f / size
  end

  def sum start = 0
    inject start, &:+
  end
end
