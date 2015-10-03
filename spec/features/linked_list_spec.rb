require "spec_helper"
require "linked_list.rb"

describe 'linked lists' do
  it "returns a valid node" do
    node = Node.new(0)
    assert_equal node.value, 0
    assert_equal node.next_node, nil
  end

  it "returns a list" do
    list = LinkedList.new(0)
    list.add
    list.add
    assert_equal list.nodes.count, 3
  end

  it "returns a string of values for to_s" do
    list = LinkedList.new(0)
    list.add
    list.add
    assert_equal list.to_s, "[0, 1, 2]"
  end
end
