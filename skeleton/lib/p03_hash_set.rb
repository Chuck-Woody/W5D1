class HashSet
  attr_reader :count
  attr_writer :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key)
      self[key] << key
      self.count +=1
    end
    if num_buckets == count
      resize!
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      self.count -= 1
    end

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
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
