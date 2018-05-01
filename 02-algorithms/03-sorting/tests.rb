class Array
  def quickSort(low=0, high=self.length-1)
    self.push("fluff")
  end
  def partition(low=0, high=1)
    pivot_index = 0
    pivot_value = self.[](low)
    puts pivot_value
    #new_array = [pivot_value]
    #for item in @array[low..high]
    #  if item > pivot_value
    #new_array.push(item)
    #  else
    #    new_array.unshift(item)
    #    pivot_index += 1
    #  end
    #  puts "New_array is #{new_array}"
    #end
    #@array = []
    #for item in new_array
    #  @array.push(item)
    #end
    #return pivot_index+1
  end
end

array = Array.new([5,6,7,8])
array.partition

