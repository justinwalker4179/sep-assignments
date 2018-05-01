require_relative 'binary_heap'

class Array
  def heapSort
    heap = BinaryHeap.new(self.shift)
    until self.length == 0
      heap.insert(self.shift)
    end
    heap.heap.length == 2
    until heap.size == 0
      removed_item = heap.delete(heap.heap[1])
      self.unshift(removed_item)
    end
  end
end

array = [1,3,5,7,9,2,4,6,8,0]
array.heapSort
puts "#{array}"