def insertion_sort(array)
  array.each_with_index do |item, index|
    index.downto(1) do |i|
      # puts "#{item} at #{index}, #{i}th iteration"
      if item < array[i - 1]
        array.insert(i - 1, item)
        array.delete_at(i + 1)
      end
    end
  end
end

def insertion_sort_case_insensitive(array_of_strings)
  array = array_of_strings.map(&:downcase)
  array.each_with_index do |item, index|
    index.downto(1) do |i|
      # puts "#{item} at #{index}, #{i}th iteration"
      if item < array[i - 1]
        array.insert(i - 1, item)
        array.delete_at(i + 1)
      end
    end
  end
  array.map(&:capitalize)
end
