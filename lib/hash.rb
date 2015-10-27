require 'benchmark'

HashNode = Struct.new(:key, :val, :next)

class HashTable
  attr_accessor :slots

  def initialize(slots=1024)
    @slots = Array.new(slots) # [nil, nil, nil, nil, ...]
  end

  def set(key, val)
    return "key must be a string" if !(key.instance_of? String)
    index = my_hash(key)
    if @slots[index].nil?
      @slots[index] = HashNode.new(key, val, nil)
    else
      current_node = @slots[index]
      until current_node.next.nil?
        current_node = current_node.next
      end
      current_node.next = HashNode.new(key, val, nil)
    end
  end

  def get(key)
    index = my_hash(key)
    return false if @slots[index].nil?
    current_node = @slots[index]
    until current_node.next.nil?
      if current_node.key == key
        return current_node.val
      else
        current_node = current_node.next
      end
    end
    return current_node.key == key ? current_node.val : false
  end

  def delete(key)
    index = my_hash(key)
    return false if @slots[index].nil?
    if @slots[index].next.nil? && @slots[index].key == key # only one node and its a match
      value = @slots[index].val
      @slots[index] = nil
      return value
    elsif @slots[index].next.nil? # only one node and no match
      return false
    else # more than one node in the index
      current_node = @slots[index]
      until current_node.next.nil?
        if current_node.next.key == key # match
          value = current_node.next.val
          current_node.next = current_node.next.next
          return value
        else # no match
          current_node = current_node.next
        end
      end
      if current_node.next.key == key
        value = current_node.next.val
        current_node.next = nil
        return value
      else
        return false
      end
    end
  end

  def my_hash(key)
    hash_string = ""
    key.each_char do |c|
      hash_string << c.ord.to_s
    end
    hash = hash_string[0,50].to_i
    index = hash % @slots.length
    return index
  end
end

# puts Benchmark.measure { "a"*1_000_000 }
hashtable = HashTable.new

words = File.readlines('/usr/share/dict/words').map {|word| word.chomp} #array of clean words

def add_words(hashtable, words)
  words.length.times do |i|
    hashtable.set(words[i], words[i].reverse)
  end
end

def get_words(hashtable, words)
  words.length.times do |i|
    hashtable.get(words[i])
  end
end

# def how_diverse(hashtable)
#   hashtable.slots.length.times do |i|
#     puts hashtable.slots[i]
#   end
# end

Benchmark.bm do |x|
  x.report("inserting:")   { add_words(hashtable, words) }
  x.report("retrieving:")  { get_words(hashtable, words) }
end


