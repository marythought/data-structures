require "spec_helper"
require "binary_tree.rb"

describe 'binary tree' do
  it "adds a value at a specified point" do
    tree = BinTree.new("Tim")
    jony = tree.insert_as_child("Jony", tree)
    phil = tree.insert_as_child("Phil", tree)
    dan = tree.insert_as_child("Dan", jony)
    katie = tree.insert_as_child("Katie", jony)
    peter = tree.insert_as_child("Peter", katie)
    andrea = tree.insert_as_child("Andrea", katie)
    craig = tree.insert_as_child("Craig", phil)
    eddie = tree.insert_as_child("Eddie", phil)
    assert_equal 9, tree.count
    assert_equal "Jony", tree.left.value
    assert_equal "Eddie", phil.right.value
  end

  it "traverses a tree" do
    tree = BinTree.new("Tim")
    jony = tree.insert_as_child("Jony", tree)
    phil = tree.insert_as_child("Phil", tree)
    dan = tree.insert_as_child("Dan", jony)
    katie = tree.insert_as_child("Katie", jony)
    peter = tree.insert_as_child("Peter", katie)
    andrea = tree.insert_as_child("Andrea", katie)
    craig = tree.insert_as_child("Craig", phil)
    eddie = tree.insert_as_child("Eddie", phil)
    assert_equal ["Tim", "Jony", "Phil", "Dan", "Katie", "Craig", "Eddie", "Peter", "Andrea"], tree.traverse
  end

  it "traverses a tree recursively" do
    tree = BinTree.new("Tim")
    jony = tree.insert_as_child("Jony", tree)
    phil = tree.insert_as_child("Phil", tree)
    dan = tree.insert_as_child("Dan", jony)
    katie = tree.insert_as_child("Katie", jony)
    peter = tree.insert_as_child("Peter", katie)
    andrea = tree.insert_as_child("Andrea", katie)
    craig = tree.insert_as_child("Craig", phil)
    eddie = tree.insert_as_child("Eddie", phil)
    assert_equal ["Dan", "Peter", "Andrea", "Katie", "Jony", "Craig", "Eddie", "Phil", "Tim"], tree.print_orders
  end
end

