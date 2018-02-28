require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if (self.head === nil) 
      self.head = node
      self.tail = node
    else
      self.tail.next = node
      self.tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current_node = self.head
    while(current_node.next != self.tail)
      current_node = current_node.next
    end
    self.tail = current_node
    current_node.next = nil
  end

  # This method prints out a representation of the list.
  def print
    node = self.head
    while(node != nil)
      puts(node.data)
      node = node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current_node = self.head
    last_node = self.head

    while(current_node != nil) # Runs through each node in the list.
      if(current_node == node) # Checks for node to be deleted.
        if(current_node != self.head) # If node isn't head then link previous and next nodes, removing current node from list.
          last_node.next = current_node.next
        else
          self.head = current_node.next # If node is head, then make next node the new head.
        end
      end

      last_node = current_node
      current_node = current_node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = self.head
    self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    removed_node = self.head
    self.head = self.head.next
    return removed_node
  end
end
