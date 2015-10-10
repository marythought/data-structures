require "spec_helper"
require "stack"

describe 'stacks' do
  it "creates a valid node" do
    node = Node.new()
    assert_equal nil, node.value
  end

  it "returns a valid stack" do
    stack = Stack.new()
    assert_equal nil, stack.head
  end

  it "adds items to the stack" do
    stack = Stack.new()
    stack.push(0)
    stack.push(12)
    assert_equal 12, stack.head.value
  end

  it "pops an element" do
    stack = Stack.new()
    stack.push(0)
    stack.push(12)
    assert_equal 12, stack.pop.value
    assert 0, stack.head.value
  end

  it "returns a string of values for to_s" do
    stack = Stack.new()
    stack.push(0)
    stack.push(12)
    stack.push(13)
    assert_equal "13, 12, 0", stack.to_s
  end

  it "can peek at next item in stack" do
    stack = Stack.new()
    stack.push(0)
    stack.push(12)
    assert_equal 12, stack.peek
  end
end
