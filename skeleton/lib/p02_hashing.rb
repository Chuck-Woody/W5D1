class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash # this is wrong definitely maybe.
    self.each_with_index.inject(0) do |acc,(ele,idx)|
      (ele.hash + idx.hash)^acc
    end
  end
end

class String
  def hash
    self.split('').map do |ele|
      ele.ord
    end.hash
  end
  
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.values.sort.map do |v|
      v.ord
    end.hash
  end
end
