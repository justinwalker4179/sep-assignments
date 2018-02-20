require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = Array.new(width) { Array.new(height) }
  end

  # Insert a Pixel at x, y.
  def insert(pixel, x, y)
    _boundedX, _boundedY = inbounds(x, y)
    self.matrix[_boundedX].insert(_boundedY, pixel)
  end

  # Return a Pixel or null at x, y.
  def at(x, y)
    _boundedX, _boundedY = inbounds(x, y)
    return self.matrix[_boundedX][_boundedY]
  end

  private

  # Makes sure x and y are within screen size. Returns x and y.
  def inbounds(x, y)
    _xBound = self.width-1
    _yBound = self.height-1

    if(x<0)
      x = 0 
    elsif(x > _xBound)
      x = _xBound
    end

    if(y<0)
      y = 0
    elsif(y > _yBound)
      y = _yBound
    end

    return x, y
  end

end