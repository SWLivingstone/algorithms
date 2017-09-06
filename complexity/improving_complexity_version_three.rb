def refactored_for_space_complexity(*arrays)
  combined_array = arrays.flatten
  bubble_sort(combined_array)
end

def bubble_sort(collection)
  n = collection.length
  begin
    swapped = false
    (n - 1).times do |i|
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped
  collection
end

array1 = [5,22,4,7,97,44,5]
array2 = [6,9,24,68,2,3,6]
array3 = [9,32,56,37,8,3,2]

p refactored_for_space_complexity(array1, array2, array3)
