require "spec_helper"
require "integer"

describe 'integers' do
  it "finds a duplicate" do
    array = [1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10]
    assert_equal 5, find_duplicate(array)
  end

  it "identifies a palindrome" do
    assert is_palindrome?(454)
    assert is_palindrome?(0)
    assert_equal false, is_palindrome?(4356712340)
  end
end
