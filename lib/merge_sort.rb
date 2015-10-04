# first 2 then 4 then 8 etc until slice number is greater than array.length, then factor the remainder

def merge_sort(array)
  return array if array.length < 2
  current_length = 2
  while array.length > current_length
    new_array = []
    array.each_slice(current_length) do |slice|
      new_array += slice.sort!
    end
    array = new_array
    current_length = current_length * 2
  end
  1.upto(remainder) do
    array[-1]
    array.each_with_index do |item, index|
      if array[-1] <= item
        array.insert(index, array[-1])
        array.delete_at(-1)
        break
      end
    end
  end
  return array
end



