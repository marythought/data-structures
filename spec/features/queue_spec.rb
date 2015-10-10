require "spec_helper"
require "queue"

describe 'queues' do
  it "creates a valid node" do
    node = Node.new()
    assert_equal node.value, nil
  end

  it "returns a valid queue" do
    queue = Queue.new()
    assert_equal queue.first, nil
    assert_equal queue.last, nil
  end

  it "enqueues items to the end of the queue" do
    queue = Queue.new()
    queue.enqueue(0)
    queue.enqueue("kittens")
    queue.enqueue(12)
    assert_equal queue.first.value, 0
    assert_equal queue.last.value, 12
  end

  it "dequeues an element" do
    queue = Queue.new()
    queue.enqueue(0)
    queue.enqueue("kittens")
    queue.enqueue(12)
    assert_equal queue.dequeue.value, 0
    assert_equal queue.first.value, "kittens"
  end

  it "raises an error on dequeue if queue is empty" do
    queue = Queue.new()
    err = ->{ queue.dequeue }.must_raise RuntimeError
    err.message.must_match /queue is empty/
  end

  it "returns a size of the queue" do
    queue = Queue.new()
    assert_equal queue.size, 0
    queue.enqueue(0)
    queue.enqueue(12)
    queue.enqueue(13)
    assert_equal queue.size, 3
  end

  it "can peek at next item in queue" do
    queue = Queue.new()
    queue.enqueue(0)
    queue.enqueue(12)
    assert_equal queue.peek, 0
    assert_equal queue.first.value, 0
  end
end
