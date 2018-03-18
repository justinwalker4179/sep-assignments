require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def [](key)
    hash_key = self.index(key,self.size)
    return @items[hash_key].value
  end

  def []=(key, value)
    hash_key = self.index(key,self.size)
    hash_item = HashItem.new(key,value)

    # Checks for and resizes when valid collision is found.
    if (@items[hash_key] != nil && @items[hash_key].value != hash_item.value)
      self.resize
    end

    # Adds item to hash.
    @items[hash_key] = hash_item  

    puts "Size #{self.size}"
    puts "Array: #{@items}"
  end


  # Method for doubling the size of the array, rehashing the keys for each item, and inserting them back into it.
  def resize
    temp_array = Array.new(@items)
    @items = Array.new(temp_array.length*2)

    # Iterates over every item in the original array, makes a new hash key, and puts it into new @items.
    for item in temp_array do
      if item != nil
        new_hash_key = self.index(item.key,self.size)
        @items[new_hash_key] = item
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array.
  def index(key, size)
    char_value = 0
    # Adds together all of the ASCII values for each character into char_value.
    for letter in key.chars do
      char_value += letter.ord
    end
    # Increments char_value until its length equals desired size.
    until char_value.to_s.length == 7
      char_value*=11
    end

    return char_value%size
  end

  # Simple method to return the number of items in the hash.
  def size
    return @items.length
  end
end