require './main'

describe Enumerable do
  it 'my_each' do
    array = []
    [1, 2, 3].my_each { |x| array << 2 * x }
    expected = [2, 4, 6]
    expect(array).to eq expected
  end

  it 'my_each_with_index' do
    array = []
    [1, 2, 3].my_each_with_index { |value, index| array << "#{value}#{index}" }
    expected = %w[10 21 32]
    expect(array).to eq expected
  end

  it 'my_select' do
    array = [1, 1, 2, 3].my_select { |x| x == 1 }
    expected = [1, 1]
    expect(array).to eq expected
  end

  it 'my_all' do
    actual = [3, 4, 5, 6].my_all? { |x| x > 2 }
    expect(actual).to eq true
  end

  it 'my_any' do
    actual = [3, 4, 5, 6].my_any? { |x| x > 5 }
    expect(actual).to eq true
  end

  it 'my_none' do
    actual = [3, 4, 5, 6].my_none? { |x| x > 10 }
    expect(actual).to eq true
  end

  it 'my_count' do
    actual = [1, 2, 3].my_count { |x| x < 2 }
    expected = 1
    expect(actual).to eq expected
  end

  it 'my_map' do
    actual = [1, 2, 3].my_map { |x| x }
    expected = [1, 2, 3]
    expect(actual).to eq expected
  end

  it 'my_inject' do
    actual = [1, 2, 3].my_inject { |x, n| x + n }
    expected = 6
    expect(actual).to eq expected
  end

  it 'multiply_els' do
    actual = multiply_els([1, 2, 3])
    expected = 6
    expect(actual).to eq expected
  end
end
