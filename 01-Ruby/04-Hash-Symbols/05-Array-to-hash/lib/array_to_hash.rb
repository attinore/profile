def array_to_hash(array)
  hash = {}
  array.each_with_index do |element, index|
    key =
      block_given? ? yield(index) : index.to_s
    hash[key] = element
  end
  return hash
end

# def array_to_hash(array)
#   hash = {}                                        # create empty hash
#   array.each_with_index do |item, index|           # loop over array
#     key = block_given? ? yield(index) : index.to_s # ternary to set the key in both cases
#     hash[key] = item                               # set the new key/value pair
#   end
#   return hash                                      # return built hash
# end
