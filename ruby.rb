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

  def my_all?
    something_false = 0
    my_each do |x|
      something_false = 1 if yield(x) == false || yield(x).nil?
    end
    if something_false.zero?
      true
    else
      false
    end
  end

  def my_any?
    everything_false = 0
    my_each do |x|
      everything_false = 1 if yield(x) != false && !yield(x).nil?
    end
    if everything_false.zero?
      false
    else
      true
    end
  end

  def my_none?
    everything_false = 0
    my_each do |x|
      everything_false = 1 if yield(x) == true
    end
    if everything_false.zero?
      true
    else
      false
    end
  end
end

p([3, 6, 4, 8, 7].my_none? do |x|
    x == 7
  end)
