require "spec_helper"
require "insertion_sort.rb"

describe 'insertion sort' do
  it "returns a valid result with strings" do
    names = ["Brian", "Anna", "Dorothy", "Cathy", "Mary", "Deb", "Lucy", "Zach", "Beatrice"]
    assert_equal ["Anna", "Beatrice", "Brian", "Cathy", "Deb", "Dorothy", "Lucy", "Mary", "Zach"], insertion_sort(names)
  end

  it "returns valid result with numbers" do
    numbers = [1,5,2,98,4,5,2]
    assert_equal insertion_sort(numbers), [1,2,2,4,5,5,98]
  end

  it "returns sorted names with case sensitive sort" do
    names = ["Brian", "anna", "Dorothy", "cathy", "mary", "Deb", "Lucy", "zach", "Beatrice"]
    assert_equal ["Anna", "Beatrice", "Brian", "Cathy", "Deb", "Dorothy", "Lucy", "Mary", "Zach"], insertion_sort_case_insensitive(names)
  end
end


