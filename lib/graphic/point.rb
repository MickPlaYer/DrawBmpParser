class Point
  attr_reader :x
  attr_reader :y

  def initialize x, y
    @x = x
    @y = y
  end

  def add point
    @x += point.x
    @y += point.y
  end
end