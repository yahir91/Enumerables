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

  def my_all?(*arg)
    all_true = true
    if !arg.empty?
      my_each { |el| all_true &= arg[0] === el }
    elsif block_given?
      my_each { |el| all_true &= yield(el) }
    else
      my_each { |el| all_true &= el }
    end
    all_true
  end

  def my_any?(*arg)
    something_true = false
    if !arg.empty?
      my_each { |el| something_true |= arg[0] === el }
    elsif block_given?
      my_each { |el| something_true |= yield(el) }
    else
      my_each { |el| something_true |= el }
    end
    something_true
  end

  def my_none?(*arg)
    !my_any?(*arg)
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
    operator = arg.pop unless block_given?
    my_copy = arg + to_a
    memo = my_copy.shift
    if block_given?
      my_copy.my_each { |el| memo = yield(memo, el) }
    else
      my_copy.my_each { |el| memo = memo.send(operator, el) }
    end
    memo
  end

  def multiply_els
    my_inject(:*)
  end
end
