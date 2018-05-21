def worst_case(n)
  array = Array.new(n-1,nil)
  array.push(n)
  puts "#{array}"
  iterations = 1
  for item in array
    if item == n
      break
    end
    iterations += 1
  end
  
  return iterations
end

puts worst_case(10)