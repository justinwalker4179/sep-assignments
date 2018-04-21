
class Node
  attr_accessor :name
  attr_accessor :film_actor_hash

  def initialize()
    self.film_actor_hash = Hash.new()
  end
end