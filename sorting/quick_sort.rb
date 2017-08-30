def quick_sort(array)
  if array.length <= 1
    return array
  end
  pivot_index = array.length - 1
  pivot = array[pivot_index]
  target_index = 0
  target = array[target_index]
  while target != pivot
    if target > pivot
      array = move_target(array, target_index)
      pivot_index += -1
    else
      target_index += +1
    end
    target = array[target_index]
  end
  if array.length <= 2
    return array
  else
    left_side = array[0...pivot_index]
    right_side = array[pivot_index + 1.. -1]
    pivot = [pivot]
  end
  combine_left_and_right(left_side, right_side, pivot)
end

def combine_left_and_right(left_side, right_side, pivot)
  if left_side.length > 1 && right_side.length > 1
    sorted_array = quick_sort(left_side) + pivot + quick_sort(right_side)
  elsif right_side.length <= 1
    sorted_array = quick_sort(left_side) + pivot + right_side
  else
    sorted_array = left_side + pivot + quick_sort(right_side)
  end
end

def move_target(array, target)
  temp = array[target]
  array.delete_at(target)
  array.push(temp)
  return array
end

# test_array = ["c","g","j","i","a","d","b","z","z","e","h","f","f"]
# p quick_sort(test_array)
