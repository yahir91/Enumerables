module Enumerable
  def my_each
    return to_enum unless block_given?

    length.times { |i| yield(self[i]) }
    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    length.times { |i| yield(self[i], i) }
  end

  def my_select
    return to_enum unless block_given?

    array = []
    my_each { |n| array.push(n) if yield(n) == true }
    array
  end

  def my_all?
    something_false = true
    if block_given?
      my_each { |x| something_false = false if yield(x) == false || yield(x).nil? }
    else
      my_each { |x| something_false = false if x == false || x.nil? }
    end
    something_false
  end

  def my_any?
    everything_false = false
    if block_given?
      my_each { |x| everything_false = true if yield(x) != false && !yield(x).nil? }
    else
      my_each { |x| everything_false = true if x != false && !x.nil? }
    end
    everything_false
  end

  def my_none?
    everything_false = true
    if block_given?
      my_each { |x| everything_false = false if yield(x) == true }
    else
      my_each { |x| everything_false = false if x == true }
    end
    everything_false
  end

  def my_count(arg = nil)
    count = 0
    if block_given?
      my_each { |x| count += 1 if yield(x) == true }
      count
    elsif arg
      my_each { |x| count += 1 if arg == x }
      count
    else
      length
    end
  end

  def my_map(proc1 = nil)
    new_array = []
    return to_enum unless block_given?

    if proc1
      my_each { |x| new_array.push(proc1.call(x)) }
    else
      my_each { |x| new_array.push(yield(x)) }
    end
    new_array
  end

  def my_inject(*arg)
    if block_given?
      memo = arg[0].nil? ? self[0] : arg[0]
      i = arg[0].nil? ? 1 : 0
      while i < length
        memo = yield(memo, self[i])
        i += 1
      end
    else
      operator = arg[0].is_a?(Symbol) ? arg[0] : arg[1]
      memo = arg[0].is_a?(Symbol) ? self[0] : arg[0]
      i = arg[0].is_a?(Symbol) ? 1 : 0
      while i < length
        memo = memo.send(operator, self[i])
        i += 1
      end
    end
    memo
  end

  def multiply_els
    my_inject(:*)
  end
end

puts [10, 25, 15, 30] .multiply_els
puts [10, 25, 15, 30] .inject(:*)
puts [10, 25, 15, 30] .my_inject(5, :*)
puts [10, 25, 15, 30] .my_inject { |sum, n| sum + n }
puts [10, 25, 15, 30] .my_inject { |product, n| product * n }
