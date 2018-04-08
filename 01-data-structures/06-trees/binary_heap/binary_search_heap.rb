require_relative 'node'

class BinarySearchHeap
  def initialize(root)
  end

  def insert(root, node)
  end

  def find(root, data)
  end

  def delete(root, data)
  end
end

root = Node.new("The Matrix", 87)

heap = BinarySearchHeap.new(root)
pacific_rim = Node.new("Pacific Rim", 72)
braveheart = Node.new("Braveheart", 78)
jedi = Node.new("Star Wars: Return of the Jedi", 80)
donnie = Node.new("Donnie Darko", 85)
inception = Node.new("Inception", 86)
district = Node.new("District 9", 90)
shawshank = Node.new("The Shawshank Redemption", 91)
martian = Node.new("The Martian", 92)
hope = Node.new("Star Wars: A New Hope", 93)
empire = Node.new("Star Wars: The Empire Strikes Back", 94)
mad_max_2 = Node.new("Mad Max 2: The Road Warrior", 98)

heap.insert(root, pacific_rim)
heap.insert(root, braveheart)
heap.insert(root, donnie)
heap.insert(root, inception)
heap.insert(root, district)
heap.insert(root, hope)
heap.insert(root, martian)
heap.insert(root, empire)
heap.insert(root, mad_max_2)

#puts root.title
#puts root.left.title
#puts root.right.title
#puts root.left.left.title
#puts root.left.right.title
#puts root.right.left.title
#puts root.right.right.title

#puts tree.find(root, martian).title
#puts tree.find(root, "Nope")