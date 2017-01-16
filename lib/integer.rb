# Question 12: Write Java program to check if a number is a palindrome or not?
#
# Read more: 

def find_duplicate(array)
  # expected = (1..array.length - 1).to_a.reduce(&:+)
  expected = (array.length - 1) * array.length / 2
  actual = array.reduce(&:+)
  actual - expected
end

def is_palindrome?(integer)
  integer.to_s == integer.to_s.reverse
end
