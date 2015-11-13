require "spec_helper"
require "linked_list"

describe 'linked lists' do
  it "returns a list with head at most recent added" do
    list = LinkedList.new
    list.insert(1)
    list.insert(0)
    list.insert(10)
    assert_equal 10, list.head.value
    assert_equal 0, list.head.next.value
    assert_equal 1, list.head.next.next.value
  end

  it "returns a string of values for to_s" do
    list = LinkedList.new
    list.insert(10)
    list.insert(20)
    list.insert("ponies")
    list.insert(true)
    assert_equal 'true, ponies, 20, 10', list.to_s
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
    assert_equal "0", list.to_s
  end

  it "removes an existing node value at the bottom" do
    list = LinkedList.new
    list.insert(0)
    list.insert(10)
    assert_equal 0, list.remove(0)
    assert_equal "10", list.to_s
  end

  it "returns true or false for find" do
    list = LinkedList.new
    list.insert(0)
    list.insert(10)
    assert_equal true, list.search(0)
    assert_equal false, list.search(7)
  end

  it "reverses a list with multiple elements" do
    list = LinkedList.new
    list.insert(0)
    list.insert(10)
    list.insert(4)
    list.insert(5)
    list.reverse!
    assert_equal '0, 10, 4, 5', list.to_s
  end

  it "reverses a list with only one element" do
    list = LinkedList.new
    list.insert(0)
    list.reverse!
    assert_equal '0', list.to_s
  end
end
