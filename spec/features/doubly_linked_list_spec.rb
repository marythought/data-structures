require "spec_helper"
require "doubly_linked_list"

describe 'linked lists' do
  it "sets head and tail to first node added" do
    list = DoublyLinkedList.new
    list.enqueue(1)
    assert_equal 1, list.head.value
    assert_equal 1, list.tail.value
  end

  it "returns a list with head and tail when nodes added" do
    list = DoublyLinkedList.new
    list.enqueue(1)
    list.enqueue(0)
    list.enqueue(10)
    assert_equal 1, list.head.value
    assert_equal 10, list.tail.value
  end

  it "can add from the front of the back" do
    list = DoublyLinkedList.new
    list.shift(1)
    list.shift(0)
    list.shift(10)
    assert_equal 10, list.head.value
    assert_equal 1, list.tail.value
  end

  it "returns a string of values for to_s" do
    list = DoublyLinkedList.new
    list.enqueue(10)
    list.enqueue(20)
    list.enqueue("ponies")
    list.enqueue(true)
    assert_equal '10, 20, ponies, true', list.to_s
  end

  it "returns no values for empty list" do
    list = DoublyLinkedList.new
    assert_equal "no values", list.to_s
    list.enqueue(4)
    list.remove(4)
    assert_equal "no values", list.to_s
  end

  it "removes an existing node value at the tail" do
    list = DoublyLinkedList.new
    list.enqueue(0)
    list.enqueue(4)
    list.enqueue(10)
    assert_equal 10, list.remove(10)
    assert_equal "0, 4", list.to_s
  end

  it "removes an existing node value at the head" do
    list = DoublyLinkedList.new
    list.enqueue(0)
    list.enqueue(4)
    list.enqueue(10)
    assert_equal 0, list.remove(0)
    assert_equal "4, 10", list.to_s
  end

  it "returns true or false for find" do
    list = DoublyLinkedList.new
    list.enqueue(0)
    list.enqueue(10)
    assert_equal true, list.search(0)
    assert_equal false, list.search(7)
  end
end
