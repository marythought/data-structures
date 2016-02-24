class BinTree
  attr_accessor :value, :left, :right

  def initialize(value, left = NilBinTree.new, right = NilBinTree.new)
    @value = value
    @left = left
    @right = right
  end

  def count
    @left.count + @right.count + 1
  end

  def insert(value)
    if @left.value.nil?
      @left = BinTree.new(value)
    elsif @right.value.nil?
      @right = BinTree.new(value)
    elsif @left.count <= @right.count
      @left.insert(value)
    else
      @right.insert(value)
    end
  end

  def traverse
  # from the top, l-r by level
  # adapted from The Ruby Way: Solutions and Techniques in Ruby Programming
  # By Hal Fulton, Andre Arko
    list = []
    permalist = [@value]
    list << @left unless @left.value.nil?
    list << @right unless @right.value.nil?
    loop do
      break if list.empty?
      # removes and returns the first list element
      current = list.shift
      permalist << current.value
      list << current.left unless current.left.nil?
      list << current.right unless current.right.nil?
    end
    permalist.compact
  end

  # in progress:
  # def find_visible
  #   left = []
  #   right = []
  #   count = 0
  #   until self.left.left.nil? && self.left.right.nil?
  #     find_visible self.left
  #   end
  #   until self.right.left.nil? && self.right.right.nil?
  #     find_visible self.right
  #   end
  #   # first stop at 3
  #   left << self.left.value
  #   right << self.right.value
  #   count += 1 if left.shift > self.value
  #   self.left.find_visible
  #   self.right.find_visible
  # end

  def depth
    left_height = @left.depth
    right_height = @right.depth
    (left_height > right_height) ? left_height + 1 : right_height + 1
  end

  def pre_order
    [self, @left.pre_order, @right.pre_order].compact.flatten
  end

  def print_pre_order
    "#{self.pre_order.map{ |tree| tree.value }.join(', ')}"
  end

  def in_order
    [@left.in_order, self, @right.in_order].compact.flatten
  end

  def print_in_order
    "#{self.in_order.map{ |tree| tree.value }.join(', ')}"
  end

  def post_order
    [@left.post_order, @right.post_order, self].compact.flatten
  end

  def print_post_order
    "#{self.post_order.map{ |tree| tree.value }.join(', ')}"
  end

  def find(value)
    list = []
    return self if @value == value
    list << @left unless @left.value.nil?
    list << @right unless @right.value.nil?
    loop do
      break if list.empty?
      # removes and returns the first element
      current = list.shift
      return current if current.value == value
      list << current.left unless current.left.nil?
      list << current.right unless current.right.nil?
    end
    "#{value} not found"
  end

  def insert_as_child(child, parent)
    list = []
    if @value == parent.value && @left.value.nil?
      return self.left = BinTree.new(child)
    elsif @value == parent.value && @right.value.nil?
      return self.right = BinTree.new(child)
    end
    list << @left unless @left.value.nil?
    list << @right unless @right.value.nil?
    loop do
      break if list.empty?
      # removes and returns the first element
      current = list.shift
      if current.value == parent.value && current.left.value.nil?
        return current.left = BinTree.new(child)
      elsif current.value == parent.value && current.right.value.nil?
        return current.right = BinTree.new(child)
      end
      list << current.left unless current.left.value.nil?
      list << current.right unless current.right.value.nil?
    end
    "#{parent.value} full or not found"
  end

  def remove
  end
end

class NilBinTree
  attr_accessor :value, :left, :right

  def inititalize
    @value = nil
    @left = nil
    @right = nil
  end

  def count
    0
  end

  def post_order
    nil
  end

  def depth
    0
  end

  def in_order
    nil
  end

  def pre_order
    nil
  end
end
