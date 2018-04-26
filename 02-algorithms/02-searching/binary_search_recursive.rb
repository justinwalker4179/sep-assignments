def binary_recursive_search(collection, value)
  low = 0
  high = collection.length - 1
  mid = (low + high)/2
  if collection[mid] > value
    puts "Low #{collection[0..mid-1]}"
    return binary_recursive_search(collection[0..mid-1], value)
  elsif collection[mid] < value
    puts "High #{collection[mid+1..high]}"
    return binary_recursive_search(collection[mid+1..high], value)+mid+1
  else
    return mid
  end
  puts "Not found."
  return nil
end