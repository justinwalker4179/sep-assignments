class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue.first
  end
  
  # Adds element to back of queue.
  def enqueue(element)
    @queue << element
    resetPointers
  end

  # Removes and returns element from front of queue.
  def dequeue
    item = @queue.delete_at(0)
    resetPointers
    return item
  end

  # Returns true if queue is empty.
  def empty?
    @queue.length === 0 ? true : false
  end

  private
  # Assigns the head and tail values to first and last items of the queue respectively.
  def resetPointers
    self.head = @queue.first
    self.tail = @queue.last
  end
end