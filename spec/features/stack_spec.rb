require "spec_helper"
require "stack.rb"

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
    assert_equal stack.pop, 12
  end

  it "returns a string of values for to_s" do
    stack = Stack.new()
    stack.push(0)
    stack.push(12)
    stack.push(13)
    assert_equal stack.to_s, "0, 12, 13"
  end
end
