require "spec_helper"
require "stack"

describe 'stacks' do
  it "creates a valid node" do
    node = Node.new()
    assert_equal node.value, nil
  end

  it "returns a valid stack" do
    stack = Stack.new()
    assert_equal stack.head, nil
  end

  it "adds items to the stack" do
    stack = Stack.new()
    stack.push(0)
    stack.push(12)
    assert_equal stack.head.value, 12
  end

  it "pops an element" do
    stack = Stack.new()
    stack.push(0)
    stack.push(12)
    assert_equal stack.pop.value, 12
    assert stack.head.value, 0
  end

  it "returns a string of values for to_s" do
    stack = Stack.new()
    stack.push(0)
    stack.push(12)
    stack.push(13)
    assert_equal stack.to_s, "13, 12, 0"
  end

  it "can peek at next item in stack" do
    stack = Stack.new()
    stack.push(0)
    stack.push(12)
    assert_equal stack.peek, 12
  end
end
