# Print duplicate characters from String
def print_duplicates(string)
  dict = Hash.new
  string.chars.each do |char|
    if dict[char]
      dict[char] += 1
    else
      dict[char] = 1
    end
  end
  dict.select { |k, v| v > 1}.keys.join
end

# How to check if two Strings are anagrams of each other?
"unite" "untie"

def anagrams?(word1, word2)
  word1.sort == word2.sort
end

# How to program to print first non repeated character from String?



# How to reverse String in Java using Iteration and Recursion? (solution)

def reverse(string)
  reversed_string = []
  string.chars.each do |char|
    reversed_string.unshift(char)
  end
  reversed_string.join
end

def only_digits?(string)
  !string.match(/^\d+$/).nil?
end

# How to find duplicate characters in a String?
# You need to write a program to print all duplicate character and their count in Java. For example if given String is "Programming" then your program should print
# g : 2
# r : 2
# m : 2

#7) How to count number of vowels and consonants in a String? (solution)

# One of easiest String question you will ever see. You have to write a Java program which will take a String input and print out number of vowels and consonants on that String. For example the if input is "Java" then your program should print "2 vowels and 2 consonants". If you get this question on Interview, you should clarify that whether String can contain numbers, special characters or not e.g. anything other than vowels and consonants.

# 8) How to count occurrence of a given character in String? (solution)
#
# If interviewer ask you to count occurrence of more than one character than you can either use an array, hash table or any additional data structure. In order to solve this problem, you are not allowed to do so. Your method must return count of given character, for example if input String is "Java" and given character is 'a' then it should return 2. Bonus point if you handle case, null and empty String and come up with unit tests.

# 9) How to convert numeric String to an int? (solution)

def numeric_to_int(string)
  string.to_i
end
# A classical coding interview question based upon String. You need to write a method like atoi() from C/C++, which takes a numeric String and return its int equivalent. For example, if you pass "67263" to the program then it should return 67263. Make sure your solution is robust i.e. it should be able to handle + and - character, null and empty String, integer overflow and other corner cases. Bonus points if you come up with good unit test cases. By the way, if your interviewer doesn't mention to you about atoi() then you can also use Java API's parseInt() or valueOf() method to solve this problem.

# 10) How to replace each given character to other e.g. blank with %20? (solution)

# Write a Java program to replace a given character in a String to other provided character, for example if you are asked to replace each blank in a String with %20, similar to URL encoding done by the browser, so that Server can read all request parameters. For example if the input is "Java is Great" and asked to replace space with %20 then it should be "Java%20is%20Great".

# 11) How to find all permutations of String? (solution)
#
# I have seen this String interview question on many interviews. It has a easy recursive solution but thinks get really tricky when Interviewer ask you to solve this question without using recursion. You can use Stack though. Write a program to print all permutations of a String in Java, for example, the if input is "xyz" then it should print "xyz", "yzx", "zxy", "xzy", "yxz", "zyx".
#
# 12) How to reverse words in a sentence without using library method? (solution)

def reverse_words(string)
end


# 13) 13) How to check if String is Palindrome?

def palindrome?(string)
  string == string.reverse
end

# 14) How to remove duplicate characters from String? (solution)

# 15)15) How to check if a String is valid shuffle of two String? (solution)

# 16) Write a program to check if a String contains another String e.g. indexOf()? (solution)

# 17) How  to return highest occurred character in a String? (solution)

# 18) Write a program to remove a given characters from String? (solution)

# 19) Write a program to find longest palindrome in a string? (solution)

# 20) How to sort String on their length in Java? (solution)
