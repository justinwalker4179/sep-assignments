class Pixel
  attr_accessor :red
  attr_accessor :green
  attr_accessor :blue
  attr_accessor :x
  attr_accessor :y


  def initialize(red, green, blue, x, y)
    self.red = validate_color(red)
    self.green = validate_color(green)
    self.blue = validate_color(blue)
    self.x = x
    self.y = y
  end

  private
  # Checks color value is within 0-225 bounds and corrects it if it isn't.
  def validate_color(color)
    if (color<0) 
      return 0
    elsif (color>255)
      return 255
    else
      return color
    end
  end

end
