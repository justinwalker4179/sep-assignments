class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end
  # Adds item to top of stack.
  def push(item)
    @stack << item
    self.top = item
  end
  # Removes and returns top of stack.
  def pop
    topOfStack = self.top
    @stack.delete_at(-1)
    self.top = @stack.last
    return topOfStack
  end

  # Returns true if stack is empty.
  def empty?
    @stack.length === 0 ? true : false
  end
end