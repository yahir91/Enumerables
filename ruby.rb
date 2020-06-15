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

  def my_select
    array = []

    my_each do |n|
      array.push(n) if yield(n) == true
    end
    puts array
  end
end

[1, 3, 4, 5, 5, 9].my_select do |n|
  n == 5
end
