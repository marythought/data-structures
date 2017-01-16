require "spec_helper"
require "strings"

describe 'strings' do
  it "prints a duplicate" do
    assert_equal "a", print_duplicates("Java")
    assert_equal "", print_duplicates("")
    assert_equal "", print_duplicates("abcdefg")
  end

  it "reverses a string" do
    assert_equal "avaJ", reverse("Java")
    assert_equal ".xof nworb kciuq ehT", reverse("The quick brown fox.")
    assert_equal "", reverse("")
  end

  it "only digits" do
    assert only_digits?("12345")
    assert_equal false, only_digits?("ghgj8990bjbnb")
    assert_equal false, only_digits?("8990bjbnb")
    assert_equal false, only_digits?("8990bjbnb7879")
    assert_equal false, only_digits?("8990    ")
    assert_equal false, only_digits?("")
  end
end
