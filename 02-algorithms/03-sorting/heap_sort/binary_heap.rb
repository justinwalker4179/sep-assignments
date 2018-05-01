class BinaryHeap
  attr_accessor :root
  attr_accessor :heap

  def initialize(root)
    self.root = root
    self.heap = [nil,root]
  end

  def insert(number)
    if number != nil
      filler = true
      inserted = false
      for item in self.heap
        if item == nil && filler
          filler = false
        elsif item == nil && inserted == false
          item = number
          #puts "Inserted #{number}"
          inserted = true
        end
      end
      if inserted == false
        self.heap.push(number)
      end
      percolate(number)
    end
  end

  def find(number)
    found = false-
    for item in self.heap
      if item != nil
        if item == number
          found = true
          return item
        end
      end
    end
    return nil
  end
  
  def delete(number)
    index = 0
    found = false
    for item in self.heap
      if item == number
        deleted_number = item
        #puts "Found #{deleted_number}"
        target_index = index
        parent_index = index/2
        lChild_index = target_index*2
        rChild_index = lChild_index + 1
        found = true
      end
      index += 1
    end

    if found == false
      puts "#{number} not found"
      return nil
    end

    lChild = self.heap[lChild_index]
    rChild = self.heap[rChild_index]
    if lChild != nil && rChild != nil
      if rChild > lChild
        self.heap[target_index] = rChild
        if self.heap[rChild_index*2] != nil
          dropLeftChild(rChild_index*2)
        end
        self.heap.delete_at(rChild_index)
      else
        self.heap[target_index] = lChild
        if self.heap[lChild_index*2+1] != nil
          dropRightChild(lChild_index*2+1)
        end
        self.heap.delete_at(lChild_index)
      end
    elsif lChild != nil && rChild == nil
      self.heap[target_index] = lChild
      if self.heap[lChild_index*2+1] != nil
        dropRightChild(lChild_index*2+1)
      end
      self.heap.delete_at(lChild_index)

    elsif lChild == nil && rChild != nil
      self.heap[target_index] = rChild
      if self.heap[rChild_index*2] != nil
        dropLeftChild(rChild_index*2)
      end
      self.heap.delete_at(rChild_index)
    else
      self.heap.delete_at(target_index)
    end
    self.fixErrors()
    return deleted_number
  end

  def print()
    puts "---------------------"
    for item in self.heap
      if item != nil
        puts "#{item}"
      end
    end
    puts "---------------------"
  end

  def size()
    return self.heap.compact.length
  end

  def fixErrors()
    if self.root != self.heap[1]
      self.root = self.heap[1]
    end
    index = 0
    for item in self.heap
      if item != nil
        parent = self.heap[index/2]
        if parent != nil && item > parent
          percolate(item)
        end
      end
      index += 1
    end
  end
  
  private
  def percolate(number)
    index = 0
    target_index = nil
    for item in self.heap
      if item != nil
        if item == number
          target_index = index
        end
      end
      index += 1
    end
    if target_index != nil
      parent_index = target_index/2
      parent = self.heap[parent_index]
    

      if parent != nil && number > self.heap[parent_index]
          self.heap[parent_index] = number
          self.heap[target_index] = parent
          percolate(number)
      end
      if parent == nil
        self.root = number
      end
    end
  end

  def dropRightChild(child_index)
    #puts "Dropping right child #{self.heap[child_index]}"
    dropped_child = self.heap[child_index]
    self.heap.delete_at(child_index)
    self.insert(dropped_child)
  end

  def dropLeftChild(child_index)
    #puts "Dropping left child #{self.heap[child_index]}"
    dropped_child = self.heap[child_index]
    self.heap.delete_at(child_index)
    self.insert(dropped_child)
  end
end