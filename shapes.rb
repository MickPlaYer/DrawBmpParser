class Circle
  def initialize radius
    @radius = radius
  end

  def draw
    puts 'You draw a circle(radius:' + @radius.to_s + ')'
  end
end

class Rectangle
  def initialize width, height
    @width = width
    @height = height
  end

  def draw
    puts 'You draw a rectangle(width:' + @width.to_s + ' height:' + @height.to_s + ')'
  end
end