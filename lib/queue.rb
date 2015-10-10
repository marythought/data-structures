Node = Struct.new(:value, :next)

class Queue
  attr_accessor :first, :last

  def initialize()
    @first = nil
    @last = nil
  end

  def enqueue(data)
    if @first == nil
      @first = Node.new(data, nil)
      @last = @first
    else
      current = Node.new(data, nil)
      @last.next = current
      @last = current
    end
  end

  def dequeue
    raise "queue is empty" if @first.nil?
    top = @first
    @first = top.next
    return top
  end

  def peek
    return @first.value
  end

  def size
    return 0 if @first.nil?
    count = 0
    current = @first
    until current.next.nil?
      count += 1
      current = current.next
      end
    return count + 1
  end

end

