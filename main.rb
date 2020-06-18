module Enumerable
  def my_each
    copy = to_a
    return to_enum unless block_given?

    copy.length.times { |i| yield(copy[i]) }
    self
  end

  def my_each_with_index
    copy = to_a
    return to_enum unless block_given?

    copy.length.times { |i| yield(copy[i], i) }
    self
  end

  def my_select
    copy = to_a
    return to_enum unless block_given?

    array = []
    copy.my_each { |n| array.push(n) if yield(n) == true }
    array
  end

  def my_all?(*arg)
    copy = to_a
    all_true = true
    if !arg.empty?
      copy.my_each { |el| all_true &= arg[0] === el }
    elsif block_given?
      copy.my_each { |el| all_true &= yield(el) }
    else
      copy.my_each { |el| all_true &= el }
    end
    all_true
  end

  def my_any?(*arg)
    copy = to_a
    something_true = false
    if !arg.empty?
      copy.my_each { |el| something_true |= arg[0] === el }
    elsif block_given?
      copy.my_each { |el| something_true |= yield(el) }
    else
      copy.my_each { |el| something_true |= el }
    end
    something_true
  end

  def my_none?(*arg)
    copy = to_a
    something_true = false
    if !arg.empty?
      copy.my_each { |el| something_true |= arg[0] === el }
    elsif block_given?
      copy.my_each { |el| something_true |= yield(el) }
    else
      copy.my_each { |el| something_true |= el }
    end
    !something_true
  end

  def my_count(arg = nil)
    copy = to_a
    count = 0
    if block_given?
      copy.my_each { |x| count += 1 if yield(x) == true }
      count
    elsif arg
      copy.my_each { |x| count += 1 if arg == x }
      count
    else
      length
    end
  end

  def my_map(proc1 = nil)
    copy = to_a
    new_array = []
    return to_enum unless block_given?

    if proc1
      copy.my_each { |x| new_array.push(proc1.call(x)) }
    else
      copy.my_each { |x| new_array.push(yield(x)) }
    end
    new_array
  end

  def my_inject(*arg)
    raise LocalJumpError unless block_given? || !arg.empty?

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
end

def multiply_els(array)
  array.my_inject(:*)
end
