 # This method takes n arrays as input and combines them in sorted
 # ascending order
 def poorly_written_ruby(*arrays)
   combined_array = []
   arrays.each do |array|
     array.each do |value|
       combined_array << value
     end
   end

   sorted_array = [combined_array.delete_at(combined_array.length-1)]

   for val in combined_array
     i = 0
     while i < sorted_array.length
       if val <= sorted_array[i]
         sorted_array.insert(i, val)
         break
       elsif i == sorted_array.length - 1
         sorted_array << val
         break
       end
       i+=1
     end
   end

   # Return the sorted array
   sorted_array
 end




 def refactored_ruby(*arrays)
   combined_array = arrays.flatten
   sorted_array = [combined_array.delete_at(combined_array.length-1)]
   combined_array.each do |val|
     sorted_array.each_with_index do |item, i|
       if val <= item
         sorted_array.insert(i, val)
         break
       elsif i == sorted_array.length - 1
         sorted_array << val
       end
     end
   end
   sorted_array
 end

 array1 = Array.new(50) {rand(1...1000)}
 array2 = Array.new(50) {rand(1...1000)}
 array3 = Array.new(50) {rand(1...1000)}

 p refactored_ruby(array1, array2, array3)
