class Array
  def quickSort(low, high)
    if low < high
      puts "Array before is #{self}"
      pivot_index = self.partition(low, high)
      self.quickSort(low, pivot_index - 1)
      self.quickSort(pivot_index + 1, high)
      puts "Array after sort is #{self}"
    end
  end
  def partition(low, high)
    pivot_index = -1
    pivot_value = self.[](low)
    new_array = []
    for item in self.[](low..high)
      if item > pivot_value
        new_array.push(item)
      else
        new_array.unshift(item)
        pivot_index += 1
      end
    end
    
    for item in new_array
      self.[]=(low,item)
      low += 1 unless low == high
    end
    return pivot_index
  end
end



array = [8,4,6,9,5,1,10,3,2,7]
length = array.length-1


array.quickSort(0,length)
puts "Sorted array is supposed to be #{array}"
#array.partition(2,4)
#puts "Partitioned #{array}"
#array.partition(4,6)
#puts "Partitioned #{array}"