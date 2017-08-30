def bucket_sort(array)
  max_array_value = find_max_value(array)
  number_of_elements = array.length
  array_of_buckets = make_buckets(number_of_elements)
  array.each do |un_sorted_item|
    bucket_number = un_sorted_item * number_of_elements / (max_array_value + 1)
    current_bucket = array_of_buckets[bucket_number]
    if current_bucket[0]
      current_bucket = insertion_sorter(un_sorted_item, current_bucket)
      array_of_buckets[bucket_number] = current_bucket
    else
      current_bucket << un_sorted_item
    end
  end
  array_of_buckets.flatten!
end

def make_buckets(number_of_elements)
  array_of_buckets = []
  number_of_elements.times do
    array_of_buckets << []
  end
  array_of_buckets
end

def insert_new_item(array, item, index)
  array = array[0...index] + array[index..-1].unshift(item)
end

def insertion_sorter(un_sorted_item, array)
  array.each_with_index do |sorted_item, index|
    if un_sorted_item < sorted_item
      array = insert_new_item(array, un_sorted_item, index)
      return array
    end
  end
  array << un_sorted_item
end

def find_max_value(array)
  max = 0
  array.each do |n|
    max = n if n > max
  end
  max
end

# test_array = Array.new(5) {rand(1...100)}
# test_array2 = [3, 3, 5, 9, 6, 3, 4, 2, 13, 19]
#
# p bucket_sort(test_array)
