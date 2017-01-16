require "spec_helper"
require "bubble_sort"

describe 'bubble sort' do
  it "returns valid result with numbers" do
    numbers = [1,5,2,98,4,5,2]
    assert_equal [1,2,2,4,5,5,98], bubble_sort(numbers)
  end
end
