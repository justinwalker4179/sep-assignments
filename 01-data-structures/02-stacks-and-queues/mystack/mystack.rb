class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end
  # Adds item to top of stack.
  def push(item)
    @stack << item
    self.top != nil ? self.top+=1 : self.top=0 # Turns top from nil into 0 or increments top.
  end
  # Removes and returns top of stack.
  def pop
    topOfStack = @stack[self.top-1]
    @stack.delete_at(self.top-1)

    self.top != 0 ? self.top-=1 : self.top=nil # Returns top to nil when stack is empty or decrements top.
    return topOfStack
  end

  # Returns true if stack is empty.
  def empty?
    @stack.length === 0 ? true : false
  end
end