Node = Struct.new(:value, :next)

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert(value)
    @head = Node.new(value, @head)
  end

  def to_s
    current = @head
    return "no values" if current.nil?
    string = ""
    until current.next.nil?
      string += "#{current.value}, "
      current = current.next
    end
    string += current.value.to_s
    string
  end

  def search(value)
    current = @head
    until current.nil?
      return true if current.value == value
      current = current.next
    end
    false
  end

  def remove(value)
    current = @head
    if current.value == value
      @head = current.next
      return value
    end
    until current.next.nil?
      if current.next.value == value
        current.next = current.next.next
        return value
      end
      current = current.next
    end
  end

  # 3, 4, 5, 6, 7, 8, 9, 10 --> 3
  def last_node
    current = @head
    # need to make 10.next = @head
    until current.next.nil?
      current = current.next
    end
    current
    # current is at last node
  end

  def make_loop!
    current = @head
    # need to make 10.next = @head
    until current.next.nil?
      current = current.next
    end
    current.next = @head
    # current is at last node
  end

  def reverse!
    current = @head
    previous = nil
    until current.next.nil?
      nxt = current.next
      current.next = previous
      previous = current
      current = nxt
    end
    current.next = previous
    previous = current
    @head = previous
  end

  def middle
    current = @head
    jumper = @head
    until jumper.nil? || jumper.next.nil? do
      current = current.next
      jumper = jumper.next ? jumper.next.next : nil
    end
    current.value
  end

  def is_loop?
    current = @head
    jumper = @head
    until jumper.nil? || jumper.next.nil? do
      current = current.next
      jumper = jumper.next ? jumper.next.next : nil
      break if current == jumper
    end
    current == jumper
  end
end

#
# Question 2: How to find if linked list has a loop ?
#
# This question has bit of similarity with earlier algorithm and data structure interview question. I mean we can use two pointer approach to solve this problem. If we maintain two pointers, and we increment one pointer after processing two nodes and other after processing every node, we are likely to find a situation where both the pointers will be pointing to same node. This will only happen if linked list has loop.
#
#
#
# Question 3 : How to find 3rd element from end in a linked list in one pass?
#
# This is another frequently asked linked list interview question. This question is exactly similar to finding middle element of linked list in single pass. If we apply same trick of maintaining two pointers and increment other pointer, when first has moved up to 3rd element, than when first pointer reaches to the end of linked list, second pointer will be pointing to the 3rd element from last in a linked list.
#
#
# Read more: http://javarevisited.blogspot.com/2013/03/top-15-data-structures-algorithm-interview-questions-answers-java-programming.html#ixzz4VrbQi4UT
