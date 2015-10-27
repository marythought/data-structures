require "spec_helper"
require "hash.rb"

describe 'hash table' do
  it "creates a hash table of fixed size" do
    hash = HashTable.new(1024)
  end

  it "hashes a key" do
    assert_equal ("?????"), hash.hash("one")
  end

  it "stores a value at a given key" do
    assert_equal ("one", 1), hash.set("one", 1)
    assert_equal ("ten", 10), hash.set("ten", 10)
    assert_equal ("five", "bananas"), hash.set("five", "bananas")
  end

  it "gets a value stored at a given key" do
    assert_equal 1, hash.get("one")
    assert_equal 10, hash.get("ten")
    assert_equal "bananas", hash.get("five")
  end

  it "deletes a value at a given key, and returns the value" do
    assert_equal "bananas", hash.delete("five")
    assert_equal nil, hash.get("five") # should not find it after deleted
  end
end



