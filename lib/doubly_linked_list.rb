DLLNode = Struct.new(:value, :prev, :next)

class DoublyLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def enqueue(value)
    @tail = DLLNode.new(value, @tail, nil)
    @tail.prev.next = @tail if @tail.prev
    @head = @tail unless @head
  end

  # insert at front
  def unshift(value)
    @head = DLLNode.new(value, nil, @head)
    @head.next.prev = @head if @head.next
    @tail = @head unless @tail
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
    current.value == value
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



