module Enumerable
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end
end

[1, 3, 4, 5, 5, 9].my_each_with_index do |x, y|
  puts x, y
end
