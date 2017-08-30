require 'benchmark'
require_relative 'heap_sort/heap_sort'
require_relative 'bucket_sort'
require_relative 'quick_sort'
require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'bubble_sort'
require_relative 'merge_sort'

test_array = Array.new(50) {rand(1...1000)}

Benchmark.bm do |x|
  puts "Sort array length 1000"
  heap = x.report("Heap") do
    heap_sort(test_array)
  end
  bucket = x.report("Bucket") do
    bucket_sort(test_array)
  end
  quick = x.report("Quick") do
    quick_sort(test_array)
  end
  insertion = x.report("Insertion") do
    insertion_sort(test_array)
  end
  selection = x.report("Selection") do
    selection_sort(test_array)
  end
  bubble = x.report("Bubble") do
    bubble_sort(test_array)
  end
  merge = x.report("Merge") do
    merge_sort(test_array)
  end
  array_of_data =[]
  array_of_data << heap
  array_of_data << bucket
  array_of_data << quick
  array_of_data << insertion
  array_of_data << selection
  array_of_data << bubble
  array_of_data << merge

  array_of_data.each do |t|
    bar_size = t.real * 100000
    bar = '#' * bar_size
    p "#{t.label}:  #{bar}"
  end
end
