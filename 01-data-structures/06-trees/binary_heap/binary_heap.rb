require_relative 'movie'

class BinaryHeap
  attr_accessor :root
  attr_accessor :heap

  def initialize(root)
    self.root = root
    self.heap = [nil,root]
  end

  def insert(movie)
    if movie != nil
      filler = true
      inserted = false
      for item in self.heap
        if item == nil && filler
          filler = false
        elsif item == nil
          item = movie
          inserted = true
        end
      end
      if inserted == false
        self.heap.push(movie)
      end
      percolate(movie)
    end
  end

  def find(movie_title)
    found = false
    for item in self.heap
      if item != nil
        if item.title == movie_title
          found = true
          return item
        end
      end
    end
    return nil
  end
  
  def delete(movie)
    index = 0
    found = false
    for item in self.heap
      if item != nil && item.title == movie
        target_index = index
        parent_index = index/2
        lChild_index = target_index*2
        rChild_index = lChild_index + 1
        found = true
      end
      index += 1
    end

    if found == false
      return nil
    end

    lChild = self.heap[lChild_index]
    rChild = self.heap[rChild_index]
    if lChild != nil && rChild != nil
      if rChild.rating > lChild.rating
        self.heap[target_index] = rChild
        if self.heap[rChild_index*2] != nil
          dropLeftChild(lChild_index*2)
        end
      else
        self.heap[target_index] = lChild
        if self.heap[lChild_index*2+1] != nil
          dropRightChild(lChild_index*2+1)
        end
      end
    elsif lChild != nil && rChild == nil
      self.heap[target_index] = lChild
      if self.heap[lChild_index*2+1] != nil
        dropRightChild(lChild_index*2+1)
      end
    elsif lChild == nil && rChild != nil
      self.heap[target_index] = rChild
      if self.heap[rChild_index*2] != nil
        dropLeftChild(lChild_index*2)
      end
    end
    self.fixErrors()
  end

  def print()
    for item in self.heap
      if item != nil
        puts "#{item.title}: #{item.rating}"
      end
    end
  end

  def fixErrors()
    index = 0
    for item in self.heap
      if item != nil
        parent = self.heap[index/2]
        if parent != nil && item.rating > parent.rating
          percolate(item)
        end
      end
      index += 1
    end
  end
  
  private
  def percolate(movie)
    index = 0
    for item in self.heap
      if item != nil
        if item == movie
          target_index = index
        end
      end
      index += 1
    end

    parent_index = target_index/2
    parent = self.heap[parent_index]
    
    if parent != nil && movie.rating > self.heap[parent_index].rating
        self.heap[parent_index] = movie
        self.heap[target_index] = parent
        percolate(movie)
    end
    if parent == nil
      self.root = movie
    end
  end

  def dropRightChild(child_index)
    dropped_child = self.heap[child_index]
    self.heap[child_index] = nil
    self.insert(dropped_child)
  end

  def dropLeftChild(child_index)
    dropped_child = self.heap[child_index]
    self.heap[child_index] = nil
    self.insert(dropped_child)
  end
end
