require "spec_helper"
require "queue"

describe 'queues' do
  it "creates a valid node" do
    node = Node.new()
    assert_nil(node.value)
  end

  it "returns a valid queue" do
    queue = Queue.new()
    assert_nil(queue.first)
    assert_nil(queue.last)
  end

  it "enqueues items to the end of the queue" do
    queue = Queue.new()
    queue.enqueue(0)
    queue.enqueue("kittens")
    queue.enqueue(12)
    assert_equal 0, queue.first.value
    assert_equal 12, queue.last.value
  end

  it "dequeues an element" do
    queue = Queue.new()
    queue.enqueue(0)
    queue.enqueue("kittens")
    queue.enqueue(12)
    assert_equal 0, queue.dequeue.value
    assert_equal "kittens", queue.first.value
  end

  it "raises an error on dequeue if queue is empty" do
    queue = Queue.new()
    err = ->{ queue.dequeue }.must_raise RuntimeError
    err.message.must_match /queue is empty/
  end

  it "returns a size of the queue" do
    queue = Queue.new()
    assert_equal 0, queue.size
    queue.enqueue(0)
    queue.enqueue(12)
    queue.enqueue(13)
    assert_equal 3, queue.size
  end

  it "can peek at next item in queue" do
    queue = Queue.new()
    queue.enqueue(0)
    queue.enqueue(12)
    assert_equal 0, queue.peek
    assert_equal 0, queue.first.value
  end
end
