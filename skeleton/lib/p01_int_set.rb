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
    unless @store.include?(num)
      @store[num] = num 
      @count += 1
    end
    if count == @store.length
      resize!
    end
  end

  def remove(num)
    if @store.include?(num)
      @store[num] = nil
      @count -= 1
    end
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

  def resize!

     # @store = Array.new(@store.length*2) { Array.new}
      count.times do 
        @store << []
      end
  end
end
