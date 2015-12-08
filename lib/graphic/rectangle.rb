class Rectangle
  attr_reader :position

  def initialize width, height
    err_msg = "\tCreate rectangle fail!\n\tRectangle size can't under 0!"
    raise err_msg if width < 0 || height < 0
    @width, @height = width, height
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