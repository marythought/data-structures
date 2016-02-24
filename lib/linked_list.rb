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
end
