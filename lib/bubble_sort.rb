def bubble_sort(array)
  (array.length - 1).downto(0) do |end_index|
    current_index = 0
    until current_index == end_index
      if array[current_index] > array[current_index + 1]
        lower = array[current_index + 1]
        higher = array[current_index]
        array[current_index] = lower
        array[current_index + 1] = higher
      end
      current_index += 1
    end
  end
  array
end
