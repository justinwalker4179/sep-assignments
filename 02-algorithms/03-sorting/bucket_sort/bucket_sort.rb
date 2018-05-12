def bucket_sort(array)
  bucket_size = Math.sqrt(array.length).floor
  buckets = []
  new_array = []
  bucket_count = array.length/bucket_size
  min_value = array.first
  for item in array
    if item < min_value
      min_value = item
    end
  end
  bucket_count.times do
    buckets.push([])
  end
  for item in array
    bi = ((item-min_value)/bucket_size).floor
    buckets[bi].push(item)
  end
  puts "Buckets #{buckets}"
  for item in buckets
    item.sort!
    new_array.push item
  end
  puts "New array #{new_array}"
  return new_array.flatten
end

array = [10,3,9,8,7,6,5,4,3,2,1,10,11,12,14,15,0,15]
new_array = bucket_sort(array)
puts "Final array #{new_array}"