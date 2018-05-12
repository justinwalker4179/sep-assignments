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
  (bucket_count+1).times do
    buckets.push([])
  end
  for item in array
    bi = ((item-min_value)/bucket_size).floor
    buckets[bi].push(item)
  end
  for item in buckets
    item.sort!
    new_array.push item
  end
  return new_array.flatten
end