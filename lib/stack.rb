Node = Struct.new(:value, :next)

class Stack
  attr_accessor :head

  def initialize()
    @head = nil
  end

  def push(data)
    if @head == nil
      @head = Node.new(data, nil)
    else
      current = Node.new(data, @head)
      @head = current
    end
  end

  def pop
    top = @head
    @head = top.next
    return top
  end

  def to_s
    string = ""
    current = @head
    until current.next.nil?
      string += "#{current.value}, "
      current = current.next
    end
    string += "#{current.value}"
    return string
  end

  def peek
    return @head.value
  end

end

