# frozen_string_literal: true

module Enumerable
  def my_each ()
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end
end

[1, 3, 4, 5, 5, 9].my_each do |x|
  puts x
end
