def binary_search_iterative(element, sorted_array)
  low = 0
  high = sorted_array.length - 1
  mid = find_mid(low, high)
  target = sorted_array[mid]
  while target != element
    if sorted_array[low] == element
      return "Found #{sorted_array[low]} at index #{low}"
    elsif sorted_array[high] == element
      return "Found #{sorted_array[high]} at index #{high}"
    elsif target < element
      low = mid
      mid = find_mid(low, high)
    else
      high = mid
      mid = find_mid(low, high)
    end
    target = sorted_array[mid]
  end
  return "Found #{target} at index #{mid}"
end

def find_mid(low, high)
  low + ((high - low) / 2)
end



test_array = [0,1,2,3,4,5,6,7,8,9,10]

p binary_search_iterative(0, test_array)
