require_relative 'node'
require 'benchmark'
include Benchmark

class BinarySearchTree

  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  def insert(root, node)
    placed = false
    current_node = root
    while placed == false
      if node.rating > current_node.rating
        if current_node.right == nil
          current_node.right = node
          placed = true
        else
          current_node = current_node.right
        end
      else
        if current_node.left == nil
          current_node.left = node
          placed = true
        else
          current_node = current_node.left
        end
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    current_node = root
    if current_node.title == data
      return current_node
    else 
      # Searches left nodes first.
      if current_node.left != nil
        search_result = find(current_node.left, data)
        if search_result != nil
          return search_result
        end
      end
      # Then searches right nodes.
      if current_node.right != nil
        search_result = find(current_node.right, data)
        if search_result != nil
          return search_result
        end
      end
    end
    # Returns nil if nothing is found.
    return nil
  end

  def delete(root, data)
    current_node = root
    if data == nil
      return nil
    end
    # Root node is to be deleted.
    if self.root.title == data
      if self.root.right.left == nil
        self.root.right.left = self.root.left
        self.root = self.root.right
      else
        temp_node = self.root.right.left
        self.root.right.left = self.root.left
        self.root = self.root.right
        self.insert(self.root, temp_node)
      end
      deleted = true
    
    # Node on the left is to be deleted.
    elsif current_node.left != nil && current_node.left.title == data
      target_node = current_node.left
      # Target node has no left or right.
      if target_node.left == nil && target_node.right == nil
        current_node.left = nil
      # Target node has a right, but not a left.
      elsif target_node.left == nil && target_node.right != nil
        current_node.left = target_node.right
      # Target node has left but not a right.
      elsif target_node.left != nil && target_node.right == nil
        current_node.left = target_node.left
      # Target node has a left and a right.
      else
        if target_node.right.left == nil
          current_node.left = target_node.right
        else
          temp_node = target_node.right.left
          current_node.left = target_node.right
          self.insert(self.root, temp_node)
        end
      end

    # Node on the right is to be deleted.
    elsif current_node.right != nil && current_node.right.title == data
      target_node = current_node.right

      # Target node has no left or right.
      if target_node.left == nil && target_node.right == nil
        current_node.right = nil
      # Target node has a right, but not a left.
      elsif target_node.left == nil && target_node.right != nil
        current_node.right = target_node.right
      # Target node has left but not a right.
      elsif target_node.left != nil && target_node.right == nil
        current_node = target_node.left
      # Target node has a left and a right.
      else
        if target_node.right.left == nil
          current_node.right = target_node.right
        else
          temp_node = target_node.right.left
          current_node.right = target_node.right
          self.insert(self.root, temp_node)
        end
      end

    # Neither left nor right node is to be deleted.  
    else
      if current_node.left != nil
        if current_node.left.left != nil || current_node.left.right != nil
          delete(current_node.left, data)
        end
      end
      if current_node.right != nil
        if current_node.right.left != nil || current_node.right.right != nil
          delete(current_node.right, data)
        end
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    children = [self.root] if children == nil
      
    new_children = []
    for child in children
      puts "#{child.title}: #{child.rating}"

      new_children.push(child.left) if child.left != nil
      new_children.push(child.right) if child.right != nil
    end
    self.printf(new_children) if new_children.size != 0
  end
end

n = 0
root = Node.new("Root",0)
tree = BinarySearchTree.new(root)
Benchmark.benchmark(CAPTION, 15, FORMAT, ">total:", ">avg:") do |searchTree|
  searchTree.report("TREE:: ") {puts "This is the tree"}
  ti = searchTree.report("Insert:") {
    index = 7000
    counter = 1000
    until index == n
      if index == counter
        puts counter
        counter -= 1000
      end
      node = Node.new(index.to_s,index)
      tree.insert(root, node)
      index -= 1
    end
  }
  tf = searchTree.report("Find 50000: "){
    number = tree.find(root, "3000")
    puts number.title
  }
  td = searchTree.report("Delete: "){
    tree.delete(root, "1234")
  }
  [ti+tf+td, (ti+tf+td)/3]
end