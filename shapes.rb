class Point
  attr_reader :x
  attr_reader :y

  def initialize x, y
    @x = x
    @y = y
  end
end

class Circle
  def initialize radius
    @radius = radius
  end

  def draw bmp, point
    color = "%06x" % (rand * 0xffffff)
    l = (@radius * Math.cos(Math::PI / 4)).to_i
    for x in 0..l
      y = Math.sqrt(@radius * @radius - x * x).to_i
      bmp[point.x + x, point.y + y] = color
      bmp[point.x + x, point.y - y] = color
      bmp[point.x - x, point.y + y] = color
      bmp[point.x - x, point.y - y] = color
      bmp[point.x + y, point.y + x] = color
      bmp[point.x + y, point.y - x] = color
      bmp[point.x - y, point.y + x] = color
      bmp[point.x - y, point.y - x] = color
    end
    puts 'You draw a circle(radius:' + @radius.to_s + ') at point(' + point.x.to_s + ', ' + point.y.to_s + ')'
  end
end

class Rectangle
  def initialize width, height
    @width = width
    @height = height
  end

  def draw bmp, point
    color = "%06x" % (rand * 0xffffff)
    bmp[point.x, point.y] = color
    bmp[point.x + @width - 1, point.y] = color
    bmp[point.x, point.y + @height - 1] = color
    bmp[point.x + @width - 1, point.y + @height - 1] = color
    for x in 1..(@width - 2)
      bmp[point.x + x, point.y] = color
      bmp[point.x + x, point.y + @height - 1] = color
    end
    for y in 1..(@height - 2)
      bmp[point.x, point.y + y] = color
      bmp[point.x + @width - 1, point.y + y] = color
    end
    puts 'You draw a rectangle(width:' + @width.to_s + ' height:' + @height.to_s + ') at point(' + point.x.to_s + ', ' + point.y.to_s + ')'
  end
end