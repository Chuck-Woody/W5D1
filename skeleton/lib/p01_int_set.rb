class MaxIntSet
  attr_accessor :store
  def initialize(max)
    
    @store = Array.new(max,false)

  end

  def insert(num)
    raise "Out of bounds" if num < 0 || @store.length < num
    return @store[num] = true unless @store[num]== true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num] = num
  end

  def remove(num)
    @store[num] = nil
  end

  def include?(num)
    @store.flatten.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self[num].include?(num)
      self[num] << num 
      @count += 1
    end
    if count == @store.length
      resize!
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store.flatten.include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length 
  end

  def resize!
    temp = []
     @store.each do |bucket|
      
        until bucket.empty?
          temp << bucket.pop
        end
      end
      @store = Array.new(@store.length * 2) {Array.new}
      temp.each do |el|
        self[el] << el
      end
    end
end
