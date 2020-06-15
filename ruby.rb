module Enumerable
  def my_each
    if block_given?
      i = 0
      while i < length
        yield(self[i])
        i += 1
      end
    else
      to_enum
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      while i < length
        yield(self[i], i)
        i += 1
      end
    else
      to_enum
    end
  end

  def my_select
    if block_given?
      array = []
      my_each do |n|
        array.push(n) if yield(n) == true
      end
      array
    else
      to_enum
    end
  end

  def my_all?
    something_false = true
    if block_given?
      my_each do |x|
        something_false = false if yield(x) == false || yield(x).nil?
      end
    else
      my_each do |x|
        something_false = false if x == false || x.nil?
      end
    end
    something_false
  end

  def my_any?
    everything_false = false
    if block_given?
      my_each do |x|
        everything_false = true if yield(x) != false && !yield(x).nil?
      end
    else
      my_each do |x|
        everything_false = true if x != false && !x.nil?
      end
    end
    everything_false
  end

  def my_none?
    everything_false = 0
    if block_given?
      my_each do |x|
        everything_false = 1 if yield(x) == true
      end
    else
      my_each do |x|
        everything_false = 1 if x == true
      end
    end
    if everything_false.zero?
      true
    else
      false
    end
  end

  def my_count(arg = nil)
    count = 0
    if block_given?
      my_each do |x|
        count += 1 if yield(x) == true
      end
      puts count
    elsif arg
      my_each do |x|
        count += 1 if arg == x
      end
      puts count
    else
      puts length
    end
  end

  def my_map
    new_array = []
    if block_given?
      my_each do |n|
        new_array.push(yield(n))
      end
      new_array
    else
      to_enum
    end
  end
end

p([10, 10, 10].my_any? do |x|
  x == 10
end)
