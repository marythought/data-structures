require_relative "spec_helper"
require "server_allocation.rb"

describe 'stripe code challenge' do
  it "returns lowest available integer" do
    assert_equal 1, Tracer.lowest_available([]), "empty array"
    assert_equal 2, Tracer.lowest_available([1]), "single array value of 1"
    assert_equal 1, Tracer.lowest_available([5]), "single array value greater than 1"
    assert_equal 2, Tracer.lowest_available([1, 3, 5]), "multiple items in array"
    assert_equal 4, Tracer.lowest_available([1, 2, 3]), "all array values lower than lowest available"
    assert_equal 3, Tracer.lowest_available([1, 6, 2, 7, 4, 10, 8, 9, 5]), "unsorted array"
    # TODO return error for duplicate items in array
    # assert_equal 2, Tracer.lowest_available([1, 1, 3, 3, 5])
  end

  it "doesn't modify the array in place" do
    array = [4, 5, 1, 2, 3]
    Tracer.lowest_available(array)
    assert_equal array, [4, 5, 1, 2, 3]
  end

  it "allocates and deallocates" do
    t = Tracer.new
    assert_equal "apibox1", t.allocate("apibox")
    assert_equal "apibox2", t.allocate("apibox")
    assert_nil t.deallocate("apibox"), "deallocating apibox returns nil (success)"
    assert_equal "apibox1", t.allocate("apibox"), "reallocating works"
    2.times do
      t.deallocate("apibox")
    end
    assert_equal "group empty", t.deallocate("apibox")
    assert_equal "sitebox1", t.allocate("sitebox")
    assert_equal "group does not exist", t.deallocate("potato")
  end
end
