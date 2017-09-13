require "spec_helper"
require "merge_sort.rb"

describe 'merge sort' do
  it "returns a valid result with strings" do
    names = ["Brian", "Anna", "Dorothy", "Cathy", "Mary", "Deb", "Lucy", "Zach", "Beatrice"]
    assert_equal ["Anna", "Beatrice", "Brian", "Cathy", "Deb", "Dorothy", "Lucy", "Mary", "Zach"], merge_sort(names)
  end

  it "returns valid result with numbers" do
    numbers = [1,5,2,98,4,5,2]
    assert_equal [1,2,2,4,5,5,98], merge_sort(numbers)
  end
end
