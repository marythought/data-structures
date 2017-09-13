require "spec_helper"
require "hash.rb"

describe 'hash table' do
  it "creates a hash table of fixed size" do
    hash = HashTable.new(3)
    assert_equal [nil, nil, nil], hash.slots
  end

  it "hashes a key" do
    hash = HashTable.new(1024)
    assert_equal 981, hash.my_hash("one")
  end

  it "stores a value at a given key" do
    hash = HashTable.new(1024)
    assert_equal hash.set("one", 1).class, HashNode
    assert_equal "key must be a string", hash.set(1, 1)
    assert_equal "key must be a string", hash.set(:one, 1)
  end

  it "gets a value stored at a given key" do
    hash = HashTable.new(1024)
    hash.set("one", 1)
    hash.set("ten", 10)
    hash.set("five", "bananas")
    assert_equal 1, hash.get("one")
    assert_equal 10, hash.get("ten")
    assert_equal "bananas", hash.get("five")
    assert_equal false, hash.get("two")
  end

  it "deletes a value at a given key, and returns the value" do
    hash = HashTable.new(1024)
    hash.set("five", "bananas")
    assert_equal "bananas", hash.delete("five")
    assert_equal false, hash.get("five") # should not find it after deleted
  end
end
