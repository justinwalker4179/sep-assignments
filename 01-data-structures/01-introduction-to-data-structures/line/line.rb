# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members.push(person)
  end

  def leave(person)
    _placeInLine = index(person)
    self.members.delete_at(_placeInLine)
  end

  def front
    return self.members.first
  end

  def middle
    _midIndex = self.members.length/2
    return self.members[_midIndex]
  end

  def back
    return self.members.last
  end

  def search(person)
    if index(person) != nil
      return self.members[index(person)]
    else
      return nil
    end
  end

  private

  def index(person)
    return self.members.index(person)
  end

end