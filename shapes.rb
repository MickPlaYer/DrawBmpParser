def add_shapes shape1, shape2, point
  shape1 = [shape1] unless shape1.kind_of?(Array)
  shape2 = [shape2] unless shape2.kind_of?(Array)
  shape2.each do |s|
    s.position.add point
  end
  shape1 + shape2
end

def draw_shapes shapes, bmp, color, point
  shapes = [shapes] unless shapes.kind_of?(Array)
  shapes.each do |s|
    s.draw bmp, color, point
  end
end

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

class Circle
  attr_reader :position

  def initialize radius
    err_msg = "\tCreate circle fail!\n\tCircle radius can't under 0!"
    raise err_msg if radius < 0
    @radius = radius
    @position = Point.new 0, 0
  end

  def draw bmp, color, point
    l = (@radius * Math.cos(Math::PI / 4)).to_i
    left = position.x + point.x + @radius
    top = position.y + point.y + @radius
    for x in 0..l
      y = Math.sqrt(@radius * @radius - x * x).to_i
      bmp[left + x, top + y] = color
      bmp[left + x, top - y] = color
      bmp[left - x, top + y] = color
      bmp[left - x, top - y] = color
      bmp[left + y, top + x] = color
      bmp[left + y, top - x] = color
      bmp[left - y, top + x] = color
      bmp[left - y, top - x] = color
    end
    puts 'Drawing a circle(radius:' + @radius.to_s + ') at point(' + point.x.to_s + ', ' + point.y.to_s + ')'
  end
end

class Rectangle
  attr_reader :position

  def initialize width, height
    err_msg = "\tCreate rectangle fail!\n\tRectangle size can't under 0!"
    raise err_msg if width < 0 || height < 0
    @width = width
    @height = height
    @position = Point.new 0, 0
  end

  def draw bmp, color, point
    left = position.x + point.x
    top = position.y + point.y
    bmp[left, top] = color
    bmp[left + @width - 1, top] = color
    bmp[left, top + @height - 1] = color
    bmp[left + @width - 1, top + @height - 1] = color
    for x in 1..(@width - 2)
      bmp[left + x, top] = color
      bmp[left + x, top + @height - 1] = color
    end
    for y in 1..(@height - 2)
      bmp[left, top + y] = color
      bmp[left + @width - 1, top + y] = color
    end
    puts 'Drawing a rectangle(width:' + @width.to_s + ' height:' + @height.to_s + ') at point(' + left.to_s + ', ' + top.to_s + ')'
  end
end