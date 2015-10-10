require "spec_helper"
require "linked_list.rb"

describe 'linked lists' do
  it "returns a list with head at most recent added" do
    list = LinkedList.new
    list.insert(1)
    list.insert(0)
    list.insert(10)
    assert_equal list.head.value, 10
    assert_equal list.head.next.value, 0
    assert_equal list.head.next.next.value, 1
  end

  it "returns a string of values for to_s" do
    list = LinkedList.new
    list.insert(10)
    list.insert(20)
    list.insert("ponies")
    list.insert(true)
    assert_equal list.to_s, 'true, ponies, 20, 10'
  end

  it "returns no values for empty list" do
    list = LinkedList.new
    assert_equal "no values", list.to_s
    list.insert(4)
    list.remove(4)
    assert_equal "no values", list.to_s
  end

  it "removes an existing node value at the head" do
    list = LinkedList.new
    list.insert(0)
    list.insert(10)
    assert_equal 10, list.remove(10)
    assert_equal list.to_s, "0"
  end

  it "removes an existing node value at the bottom" do
    list = LinkedList.new
    list.insert(0)
    list.insert(10)
    assert_equal 0, list.remove(0)
    assert_equal list.to_s, "10"
  end

  it "returns true or false for find" do
    list = LinkedList.new
    list.insert(0)
    list.insert(10)
    assert_equal list.search(0), true
    assert_equal list.search(7), false
  end
end
