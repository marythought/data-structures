require "spec_helper"
require "binary_tree.rb"

describe 'binary tree' do
  it "adds a value at a specified point" do
    tree = BinTree.new("Tim")
    jony = tree.insert_as_child("Jony", tree)
    phil = tree.insert_as_child("Phil", tree)
    tree.insert_as_child("Dan", jony)
    katie = tree.insert_as_child("Katie", jony)
    tree.insert_as_child("Peter", katie)
    tree.insert_as_child("Andrea", katie)
    tree.insert_as_child("Craig", phil)
    tree.insert_as_child("Eddie", phil)
    assert_equal 9, tree.count
    assert_equal 4, tree.depth
    assert_equal "Jony", tree.left.value
    assert_equal "Eddie", phil.right.value
  end

  it "traverses a tree iteratively" do
    tree = BinTree.new("Tim")
    jony = tree.insert_as_child("Jony", tree)
    phil = tree.insert_as_child("Phil", tree)
    tree.insert_as_child("Dan", jony)
    katie = tree.insert_as_child("Katie", jony)
    tree.insert_as_child("Peter", katie)
    tree.insert_as_child("Andrea", katie)
    tree.insert_as_child("Craig", phil)
    tree.insert_as_child("Eddie", phil)
    assert_equal "Tim, Jony, Phil, Dan, Katie, Craig, Eddie, Peter, Andrea", tree.traverse.join(", ")
  end

  it "traverses a tree recursively" do
    tree = BinTree.new("Tim")
    jony = tree.insert_as_child("Jony", tree)
    phil = tree.insert_as_child("Phil", tree)
    tree.insert_as_child("Dan", jony)
    katie = tree.insert_as_child("Katie", jony)
    tree.insert_as_child("Peter", katie)
    tree.insert_as_child("Andrea", katie)
    tree.insert_as_child("Craig", phil)
    tree.insert_as_child("Eddie", phil)
    assert_equal ("Dan, Peter, Andrea, Katie, Jony, Craig, Eddie, Phil, Tim"), tree.print_post_order
    assert_equal ("Dan, Jony, Peter, Katie, Andrea, Tim, Craig, Phil, Eddie"), tree.print_in_order
    assert_equal ("Tim, Jony, Dan, Katie, Peter, Andrea, Phil, Craig, Eddie"), tree.print_pre_order
  end

  it "identifies visible nodes" do
    tree = BinTree.new(5)
    three = tree.insert_as_child(3, tree)
    ten = tree.insert_as_child(10, tree)
    tree.insert_as_child(20, three)
    tree.insert_as_child(21, three)
    tree.insert_as_child(1, ten)
    assert_equal [5, 3, 10, 20, 21, 1], tree.traverse
    assert_equal [20, 21, 3, 1, 10, 5], tree.print_post_order.split.map {|i| i.to_i}
    assert_equal [20, 3, 21, 5, 1, 10], tree.print_in_order.split.map {|i| i.to_i}
    assert_equal [5, 3, 20, 21, 10, 1], tree.print_pre_order.split.map {|i| i.to_i}
  end
end
