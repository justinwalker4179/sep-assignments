 # This method takes n arrays as input and combine them in sorted ascending  order
 def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    array.each do |value|
      combined_array << value
    end
  end
  sorted_array = [combined_array.delete_at(combined_array.length-1)]

  for val in combined_array
    placed = false
    for i in (0..sorted_array.length-1)
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        placed = true
        break
      end
    end
    if placed == false
      sorted_array << val
    end
  end

  # Return the sorted array
  sorted_array
end