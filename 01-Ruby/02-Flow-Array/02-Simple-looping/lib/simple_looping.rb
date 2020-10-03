def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  return -1 if min.to_i > max.to_i

  array = min..max
  sum = 0

  for num in array do
    sum += num
  end
  return sum
end

def sum_with_while(min, max)
  return -1 if min.to_i > max.to_i

  sum = 0

  while min <= max
    sum += min
    min += 1
  end

  return sum
end
