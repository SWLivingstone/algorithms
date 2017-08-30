def binary_search_recursive(element, sorted_array)
  low = 0
  high = sorted_array.length - 1
  mid = find_mid(low, high)
  if sorted_array[mid] == element
    return "Found #{sorted_array[mid]}"
  elsif sorted_array[low] == element
    return "Found #{sorted_array[low]}"
  elsif sorted_array[high] == element
    return "Found #{sorted_array[high]}"
  elsif sorted_array[mid] < element
    binary_search_recursive(element, sorted_array[mid, high])
  else
    binary_search_recursive(element, sorted_array[low, mid])
  end
end

def find_mid(low, high)
  low + ((high - low) / 2)
end


test_array = [0,1,2,3,4,5,6,7,8,9,10]

p binary_search_recursive(3, test_array)
