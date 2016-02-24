class Tree
  attr_accessor :value, :children, :parent, :level

  def initialize(value, parent = nil)
    @value = value
    @children = []
    @parent = parent
    @level = parent.nil? ? 0 : @parent.level + 1
  end

  def add_child(value, parent = self)
    child = Tree.new(value, parent)
    parent.children << child
    # child.level = parent.level + 1
  end

  def children_values
    @children.map(&:value).join(", ")
  end

  def leaf?
    @children.length == 0
  end

  def root?
    @parent.nil?
  end

  def count
    return 1 if @children.length == 0
    @children.map(&:count).reduce(1, :+)
  end

  def level_print
    temp = []
    current = self
    result = ""
    until current.nil?
      result << current.value + " "
      current.children.each do |child|
        temp << child
      end
      this_level = current.level
      current = temp.shift
      result << "\n" if current && current.level > this_level
    end
    result.strip
  end

  def find(value)
    temp = []
    return self if @value == value
    @children.each do |child|
      temp << child
    end unless @children.empty?
    loop do
      break if temp.empty?
      current = temp.shift
      if current.is_a?(Array)
        current.each do |child|
          temp << child
        end
      else
        return current if current.value == value
        current.children.each do |child|
          temp << child
        end unless current.children.empty?
      end
    end
    "#{value} not found"
  end

  def path_to_root(value)
    tree = find(value)
    path = [tree.value]
    until tree.root?
      path << tree.parent.value
      tree = tree.parent
    end
    path.join(", ")
  end

  def find_all_paths
    return @value if self.count <= 1
    @children.map(&:find_all_paths).unshift([@value])
  end

  def paths(tree, path = [])
    if tree.is_a?(String)
      [path + [tree]]
    else
      node = tree[0]
      tree[1..-1].flat_map do |branch|
        paths(branch, path + node)
      end
    end
  end

  def print_paths
    paths(find_all_paths)
  end

  def path_to_leaf(value)
    path_to_root(value).split(", ").reverse.join(", ")
  end

  def print_paths_leaf_to_root
    paths(find_all_paths).map(&:reverse)
  end
end
