require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
  end

  def []=(key, value)
    hash_key = self.index(key,self.size)
    node = Node.new(key,value)

    if @items[hash_key] == nil
      link_list = LinkedList.new()
      link_list.add_to_front(node)
      @items[hash_key] = link_list
    else
      @items[hash_key].add_to_tail(node)
    end
  end

  def [](key)
    hash_key = self.index(key,self.size)
    link_list = @items[hash_key]
    current_node = link_list.head

    until current_node.key == key
      current_node = current_node.next
    end

    return current_node.value
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

  # Calculate the current load factor
  def load_factor
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