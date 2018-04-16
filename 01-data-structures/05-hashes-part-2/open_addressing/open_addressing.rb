require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    hash_key = self.index(key,self.size)
    node = Node.new(key,value)
    
    if (@items[hash_key] != nil && @items[hash_key].value != node.value)
      next_index = self.next_open_index(hash_key)
      if next_index == -1
        self.resize
        next_index = self.next_open_index(hash_key)
      end
      hash_key = next_index
    end
    @items[hash_key] = node
  end
  
  def [](key)
    hash_key = self.index(key,self.size)

    self.size.times do
      if @items[hash_key] != nil && @items[hash_key].key == key 
        return @items[hash_key].value
      else
        hash_key += 1
      end
      if hash_key >= self.size
         hash_key = 0
      end
    end

    puts "Key not found."
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
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

  # Given an index, find the next open index in @items
  def next_open_index(index)
    new_index = index
    self.size.times do
      if @items[new_index] != nil
        new_index += 1
      else
        return new_index
      end
      if new_index >= size
        new_index = 0
      end
    end
    return -1
    #self.resize
    #self.next_open_index(index)
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    puts "RESIZING"
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

  def display
    for item in @items do
      if item == nil
        puts "nil"
      else
        puts item.value
      end
    end
  end

end