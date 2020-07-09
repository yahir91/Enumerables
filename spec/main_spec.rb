require_relative '../main'

describe Enumerable do
  context 'my_each' do
    it 'my_each with block' do
      array = []
      [1, 2, 3].my_each { |x| array << 2 * x }
      expected = [2, 4, 6]
      expect(array).to eq expected
    end
    it 'my_each without block' do
      actual = [1, 2, 3].my_each
      expect(actual).to be_a(Enumerator)
    end
  end

  context 'my_each_with_index' do
    it 'my_each_with_index with block' do
      array = []
      [1, 2, 3].my_each_with_index { |value, index| array << "#{value}#{index}" }
      expected = %w[10 21 32]
      expect(array).to eq expected
    end
    it 'my_each_with_index without block' do
      actual = [1, 2, 3].my_each_with_index
      expect(actual).to be_a(Enumerator)
    end
  end

  context 'my_select' do
    it 'my_select with block given' do
      array = [1, 1, 2, 3].my_select { |x| x == 1 }
      expected = [1, 1]
      expect(array).to eq expected
    end
    it 'my_select without block' do
      array = [1, 1, 2, 3].my_select
      expect(array).to be_a(Enumerator)
    end
  end

  context 'my_all?' do
    it 'my_all with block given' do
      actual = [3, 4, 5, 6].my_all? { |x| x > 2 }
      expect(actual).to eq true
    end
    it 'my_all with argument' do
      actual = [3, 3, 3, 3].my_all?(3)
      expect(actual).to eq true
    end
    it 'my_all with argument returning false' do
      actual = [3, 3, 3, 3].my_all?('hello')
      expect(actual).to eq false
    end
    it 'my_all without argument and block' do
      actual = [3, 3, 3, 3].my_all?
      expect(actual).to eq true
    end
  end

  context 'my_any?' do
    it 'my_any with block given' do
      actual = [3, 4, 5, 6].my_any? { |x| x > 5 }
      expect(actual).to eq true
    end
    it 'my_any with argument' do
      actual = [3, 4, 5, 6].my_any?(4)
      expect(actual).to eq true
    end
    it 'my_any with argument returning false' do
      actual = [3, 4, 5, 6].my_any?(8)
      expect(actual).to eq false
    end
    it 'my_any without argument and block' do
      actual = [3, 4, 5, 6].my_any?
      expect(actual).to eq true
    end
  end

  context 'my_none' do
    it 'my_none with block given' do
      actual = [3, 4, 5, 6].my_none? { |x| x > 10 }
      expect(actual).to eq true
    end
    it 'my_none with argument' do
      actual = [3, 4, 5, 6].my_none?(7)
      expect(actual).to eq true
    end
    it 'my_none with argument returning false' do
      actual = [3, 4, 5, 6].my_none?(4)
      expect(actual).to eq false
    end
    it 'my_none without argument and block' do
      actual = [3, 4, 5, 6].my_none?
      expect(actual).to eq true
    end
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
