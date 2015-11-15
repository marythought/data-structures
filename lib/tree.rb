class Tree
  attr_accessor :value, :children, :parent, :level

  def initialize(value, parent=nil)
    @value = value
    @children = []
    @parent = parent
    @level = 0
  end

  def add_child(value, parent=self)
    child = Tree.new(value, parent)
    parent.children << child
    child.level = parent.level + 1
  end

  def get_children_values
    @children.map{ | child | child.value }.join(", ")
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
      if current && current.level > this_level
        result << "\n"
      end
    end
    result.strip
  end
end
