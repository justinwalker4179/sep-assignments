require_relative 'quick_sort/quick_sort'
require_relative 'bucket_sort/bucket_sort'
require_relative 'heap_sort/heap_sort'
require 'benchmark'
include Benchmark

index = 50
array = []
50.times do
    array.push(index)
    index -= 1
end
puts "#{array}"
Benchmark.benchmark(CAPTION, 15, FORMAT, ">total:", ">avg:") do |quick_sort|
  quick_sort.report("Quick Sort: ") {
    quick_array = quicksort(array,0,array.length-1)
  }
end
Benchmark.benchmark(CAPTION, 15, FORMAT, ">total:", ">avg:") do |bucket_sort|
  bucket_sort.report("Bucket Sort: ") {
    bucket_array = bucket_sort(array)
  }
end
Benchmark.benchmark(CAPTION, 15, FORMAT, ">total:", ">avg:") do |heap_sort|
  heap_sort.report("Heap Sort: ") {
    array.heapSort
  }
end