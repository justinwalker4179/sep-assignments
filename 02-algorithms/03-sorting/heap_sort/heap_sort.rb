require_relative 'binary_heap'

class Array
  def heapSort
    heap = BinaryHeap.new(self.shift)
    until self.length == 0
      heap.insert(self.shift)
    end
    until heap.size == 0
      removed_item = heap.delete(heap.heap.last)
      self.unshift(removed_item)
    end
  end
end