class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :nodes

  def initialize(head)
    @head = Node.new(head)
    @nodes = [@head]
  end

  def add
    value = @head.value + 1
    next_node = @head
    @head = Node.new(value, next_node)
    @nodes << @head
  end

  def to_s
    result = @nodes.map do |node|
      node.value
    end
    return result.to_s
  end

  def search(value)
  end

  def delete(position)
  end
end

