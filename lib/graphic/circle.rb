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