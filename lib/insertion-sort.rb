names = ["Brian", "Anna", "Dorothy", "Cathy", "Mary", "Lucy", "Zach", "Beatrice"]

# First item [index 0], leave it alone.
# Second item [index 1], is it less than or equal to current index - 1 [0]?
#   if yes, insert it at index -1 [Anna, Brian, Anna, ...] and delete it from index + 1 [2]
#       # now we have [Anna, Brian, ...]
#   now, is it less than or equal to current index -
#   elsif no, leave it alone
# Third item [index 2], is it less than or equal to index - 1 [1]?
#   if yes, insert it at index -1 ....
#   elsif leave it alone
# ...
# Eigth item [index 7], is it less than or equal to index -1 [6]?
#   if yes, insert it at index -1 ...


def insertion_sort(array)
  array.each_with_index do |item, index|
    puts "looping for #{item}, #{index}"
    temp = ""
    until index == 0
      puts "#{array[index+1]} needs to move before #{item}"
      puts "#{item} is at #{index+1}"
      temp = "#{item}"
      array.delete_at(index+1)
      array.insert(index-1, temp)
    end
  end
end

class Array
  def insertionsort!
    1.upto(length - 1) do |i|
      value = self[i]
      j = i - 1
      while j >= 0 and self[j] > value
        self[j+1] = self[j]
        j -= 1
      end
      self[j+1] = value
    end
    self
  end
end
ary = [7,6,5,9,8,4,3,1,2,0]
p ary.insertionsort!
# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
# http://rosettacode.org/wiki/Sorting_algorithms/Insertion_sort#Ruby


puts names
puts '***'

puts insertion_sort(names)
