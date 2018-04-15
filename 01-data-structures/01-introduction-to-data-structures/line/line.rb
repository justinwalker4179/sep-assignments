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
    return index(person)
  end

  private

  def index(person)
    self.members.index(person)
  end

end

line = Line.new
line.join("Diane")
line.join("Jim")
line.join("Frederick")
puts(line.front)
puts(line.middle)
puts(line.back)
line.leave("Jim")
puts(line.front)
puts(line.middle)
puts(line.back)
