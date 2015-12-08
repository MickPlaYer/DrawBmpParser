
class DrawBmpParser
  rule
    start:    canvas methods

    canvas:   'canvas' number number 'color' color
              { set_canvas val[1], val[2], val[4] }

    methods:  method
            | method methods

    method:   draw
            | declare
            | pen

    draw:     'draw' shape 'at' point 
              { draw_shapes val[1], @bitmap, @color, val[3] }

    declare:  NAME 'as' shape { @shapes[val[0]] = val[2] }
            | NAME 'at' point { @points[val[0]] = val[2] }

    pen:      'pen' color { @color = val[1] }

    shape:    shape 'add' shape 'shift' point 
              { result = add_shapes val[0], val[2], val[4] }
            | 'circle' number 
              { result = Circle.new val[1] }
            | 'rectangle' number number 
              { result = Rectangle.new val[1], val[2] }
            | NAME { result = find_shape val[0] }
            
    point:    number number { result = Point.new val[0], val[1] }
            | NAME { result = find_point val[0] }

    number:   NUMBER { result = val[0].to_i }
            | NEGATIVE NUMBER { result = -(val[1].to_i) }

    color:    hex hex hex { result = val[2] + val[1] + val[0] }

    hex:      number { result = get_color_hex val[0] }
end

---- header
require "./lib/lexer.rb"
require "./lib/graphic/bmp_writer.rb"
require './lib/graphic/circle.rb'
require './lib/graphic/rectangle.rb'
require './lib/graphic/point.rb'

---- inner
  def parse str
    # Hash table for variables.
    @shapes = Hash.new
    @points = Hash.new
    @color = 'ffffff'
    # Set up lexer.
    @lexer = make_lexer str
    do_parse
  end

  def next_token
    @lexer.next_token
  end

  def make_lexer str
    keywords = ['canvas', 'color', 'pen', 'draw', 'circle', 'rectangle', 'add', 'shift', 'as', 'at']
    lexer = Lexer.new
    lexer.add_ignore(/\s+/)
    keywords.each do |kw|
      lexer.add_keyword kw
    end
    lexer.add_token(/-/, :NEGATIVE)
    lexer.add_token(/\d+/, :NUMBER)
    lexer.add_token(/\w+/, :NAME)
    lexer.start str
    return lexer
  end

  def save_bmp name
    @bitmap.save_as(name + '.bmp')
  end

  private

  def set_canvas width, height, color
    err_msg = "\tSet canvas fail!\n\tCanvas size can't under 0!"
    raise err_msg if width < 0 || height < 0
    @bitmap = BMPWriter.new  width, height, color
  end

  def get_color_hex number
    err_msg = "\tIllegal RGB number!\n\tRGB number must between 0 to 255."
    raise err_msg if number > 255 || number < 0
    return "%02x" % number
  end

  def find_shape name
    shape = @shapes[name]
    raise "\tCan't find shape with name: " + name if shape.nil?
    return shape
  end

  def find_point name
    point = @points[name]
    raise "\tCan't find point with name: " + name if point.nil?
    return point
  end

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

---- footer
# Run under code if execute by cmd > Ruby "this file"
if $0 == __FILE__
  parser = DrawBmpParser.new
  # Get data for parse from file.
  file_path = ARGV[0] || "sample/example.txt"
  file = File.open(file_path, "rb")
  contents = file.read
  file.close
  # Show what to parse.
  puts "Parsing:\n" + contents.to_s
  puts
  puts 'Result:'
  # Do parse.
  begin
    parser.parse(contents)
    puts 'Saving bitmap...'
    parser.save_bmp File.basename(file_path, ".*")
    puts 'End!'
  rescue
    puts 'Error'
    puts $!
    puts 'Parse fail!'
  end
end
