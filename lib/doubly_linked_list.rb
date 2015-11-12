DLLNode = Struct.new(:value, :prev, :next)

class DoublyLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # new nodes go in at the tail, older nodes at head.
  # "next" goes towards tail (newer), "previous" goes towards head (older)
  # first in last out

  def insert(value)
    if @head.nil?
      @tail = DLLNode.new(value, nil, nil)
      @head = @tail
    else
      @tail = DLLNode.new(value, @tail, nil)
      @tail.prev.next = @tail
    end
  end

  def to_s
    current = @head
    return "no values" if current.nil?
    string = ""
    until current == @tail
      string += "#{current.value}, "
      current = current.next
    end
    string += "#{current.value}"
  end

  def search(value)
    current = @head
    until current == @tail
      return true if current.value == value
      current = current.next
    end
    false
  end

  def remove(value)
    current = @head
    while current
      if current.value == value
        if current == @head
          @head = current.next
          current.next.prev = nil if current.next
        elsif current == @tail
          @tail = current.prev
          current.prev.next = nil if current.prev
        else
          current.next.prev = current.prev
          current.prev.next = current.next
        end
        return current.value
      else
        current = current.next
      end
    end
    return "no match found"
  end
end



