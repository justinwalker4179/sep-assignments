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
      link_list.add_to_tail(node)
      @items[hash_key] = link_list
    else
      @items[hash_key].add_to_tail(node)
    end

    self.resize if self.load_factor > self.max_load_factor
  end

  def [](key)
    hash_key = self.index(key,self.size)
    link_list = @items[hash_key]
    current_node = link_list.head
    until current_node == nil || current_node.key == key
      current_node = current_node.next
    end
    if current_node == nil
      puts "Not found"
      return nil
    else
      return current_node.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum%size
  end

  # Calculate the current load factor
  def load_factor
    values = 0.0
    for item in @items do
      if item != nil
        current_node = item.head
        until current_node == nil
          values += 1
          current_node = current_node.next
        end
      end
    end
    return values/@items.length
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    temp_array = Array.new(@items)
    @items = Array.new(temp_array.length*2)

    # Iterates over every item in the original array, makes a new hash key, and puts it into new @items.
    for item in temp_array do
      if item != nil
        current_node = item.head
        until current_node == nil
          new_hash_key = self.index(current_node.key,self.size)
          @items[new_hash_key] = item
          current_node = current_node.next
        end
      end
    end
  end

  def display
    puts "----------------"
    for item in @items do
      print = ". "
      if item == nil
        puts "nil"
      else
        current_node = item.head
        until current_node == nil
          print += "#{current_node.value} ."
          current_node = current_node.next
          puts current_node
        end
        puts print
      end
    end
    puts "_____________________"
  end
end