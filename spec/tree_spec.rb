require "spec_helper"
require "tree.rb"

describe 'a tree' do
  sample_tree = Tree.new("A")
  sample_tree.add_child("H")
  sample_tree.add_child("G")
  sample_tree.add_child("I", sample_tree.children[0])
  sample_tree.add_child("L", sample_tree.children[0])
  sample_tree.add_child("B", sample_tree.children[0])
  sample_tree.add_child("Z", sample_tree.children[-1])
  sample_tree.add_child("Y", sample_tree.children[-1])
  sample_tree = sample_tree.children[0].children[0] # I
  sample_tree.add_child("J")
  sample_tree.add_child("K")
  sample_tree = sample_tree.parent.children[1] # L
  sample_tree.add_child("M")
  sample_tree = sample_tree.parent.children[-1] # B
  sample_tree.add_child("X")
  sample_tree.children[-1].add_child("R")
  sample_tree.children[-1].add_child("P")
  sample_tree = sample_tree.parent.parent.children[-1] # G
  sample_tree.children[0].add_child("F")
  sample_tree.children[-1].add_child("D")
  sample_tree.children[-1].add_child("E")
  sample_tree.children[-1].add_child("Q")
  sample_tree = sample_tree.parent # back at A

  it "intiates a tree with a value" do
    tree = Tree.new("AZT")
    assert_equal [], tree.children
    assert_equal "AZT", tree.value
    assert_equal 0, tree.level
    assert_nil(tree.parent)
  end

  it "can add one or more child elements and increase level" do
    tree = Tree.new("TOP")
    tree.add_child("FIRST")
    assert_equal "FIRST", tree.children[-1].value
    assert_equal 1, tree.children[-1].level
    assert_equal "TOP", tree.children[-1].parent.value
    tree.add_child("FIRST_SIBLING")
    assert_equal "FIRST, FIRST_SIBLING", tree.children_values

    tree = tree.children[0]
    tree.add_child("SECOND")
    assert_equal "SECOND", tree.children[-1].value
    assert_equal 2, tree.children[-1].level
    assert_equal "FIRST", tree.children[-1].parent.value
    assert_equal "TOP", tree.children[-1].parent.parent.value
  end

  it "can print a tree in level order" do
    tree = sample_tree
    text = tree.level_print
    assert_equal "A \nH G \nI L B Z Y \nJ K M X F D E Q \nR P", text
    assert_equal "H, G", tree.children_values
  end

  it "can count" do
    tree = Tree.new("ANNA")
    assert_equal 1, tree.count
    tree.add_child("H")
    tree.add_child("G")
    tree.add_child("I", tree.children[0])
    tree.add_child("L", tree.children[0])
    assert_equal 3, tree.children[0].count
  end

  it "can find a value and return that tree" do
    tree = sample_tree.clone
    assert_equal "A", tree.value
    assert_equal "H", tree.find("H").value
    assert_equal "K", tree.find("K").value
    assert_equal "C not found", tree.find("C")
  end

  it "can find a path from root to leaf" do
    tree = sample_tree
    assert_equal "A, H, I, J", tree.path_to_leaf("J")
    assert_equal "A", tree.path_to_leaf("A")
  end

  it "can find all paths from root to leaf" do
    tree = sample_tree
    assert_equal [["A"], [["H"], [["I"], "J", "K"], [["L"], "M"], [["B"], [["X"], "R", "P"]]], [["G"], [["Z"], "F"], [["Y"], "D", "E", "Q"]]], tree.find_all_paths
    assert_equal %w(A G Y Q), tree.print_paths[-1]
  end

  it "can find a path or all paths from leaf to root" do
    tree = sample_tree
    assert_equal "J, I, H, A", tree.path_to_root("J")
    assert_equal "A", tree.path_to_root("A")
    assert_equal %w(Q Y G A), tree.print_paths_leaf_to_root[-1]
  end
end
