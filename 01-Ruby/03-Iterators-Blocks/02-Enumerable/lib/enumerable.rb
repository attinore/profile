def sum_odd_indexed(array)
  num = 0
  array.each_with_index do |element, i|
    num += element if i.odd?
  end
  return num
end

def even_numbers(array)
  array.select do |even|
    even.even?
  end
end

def short_words(array, max_length)
  array.reject do |element|
    element.length > max_length
  end
end

def first_under(array, limit)
  array.find do |number|
    number < limit
  end
end

def add_bang(array)
  array.map do |string|
    "#{string}!"
  end
end

def concatenate(array)
  array.reduce(:+)
end

def sorted_pairs(array)
  result = []
  array.each_slice(2) do |slice|
    result << slice.sort
  end
  return result
end
