require_relative 'min_binary_heap'
require_relative 'node'

def heap_sort(array)
  root = Node.new(array[0])
  heap = MinBinaryHeap.new(root)
  array[1..-1].each do |item|
    new_node = Node.new(item)
    heap.insert(new_node)
  end
  sorted_array = []
  while heap.not_empty?
    sorted_array << heap.root.title
    heap.delete(heap.root.title)
  end
  sorted_array
end

# test_array = ["c","g","j","i","a","d","b","z","z","e","h","f","f"]
#
# p heap_sort(test_array)
