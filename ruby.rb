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
      if yield(x) == false || yield(x) == nil
        something_false = 1
      end
    end
    if something_false == 0
      true
    else 
      false
    end
  end

end

p([5, 5, 5, 5, 5, 5].my_all? do |x|
  x==5
end)
