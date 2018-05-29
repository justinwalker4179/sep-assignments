# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  combined_hash = Hash.new()
  sorted_array = [arrays.first.delete_at(0)]
  index = 0
 
  arrays.each do |array|
    array.each do |value|
      combined_hash[index] = value
      index += 1
    end
  end

  last_value = combined_hash.length-1

  for index in (0..last_value)
    i = 0
    while i < sorted_array.length
      if combined_hash[index] <= sorted_array[i]
        sorted_array.insert(i, combined_hash[index])
        break
      elsif i == sorted_array.length-1
        sorted_array << combined_hash[index]
        break
      end
      i += 1
    end
  end
  # Return the sorted array
  sorted_array
end

sorted = poorly_written_ruby([3,2,1],[7,5,4])
puts sorted