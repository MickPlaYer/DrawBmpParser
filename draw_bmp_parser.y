
class DrawShapeParser
  rule
    start:    canvas methods

    canvas:   'canvas' number number
                { @bitmap = BMP::Writer.new val[1], val[2] }

    methods:  method
            | method methods

    method:   draw
            | declare

    draw:     'draw' shape point { val[1].draw @bitmap, val[2] }

    declare:  WORD 'as' shape { @shapes[val[0]] = val[2] }
            | WORD 'at' point { @points[val[0]] = val[2] }

    shape:    'circle' number { result = Circle.new val[1] }
            | 'rectangle' number number { result = Rectangle.new val[1], val[2] }
            | WORD { result = @shapes[val[0]] }

    point:    number number { result = Point.new val[0], val[1] }
            | WORD { result = @points[val[0]] }

    number:   NUMBER { result = val[0].to_i }
end

---- header
require "./lexer.rb"
require "./shapes.rb"
require "./bmp/writer.rb"

---- inner
  def parse(str)
    @shapes = Hash.new
    @points = Hash.new
    @lexer = make_lexer str
    do_parse
    @bitmap.save_as('example.bmp')
  end

  def next_token
    @lexer.next_token
  end

  def make_lexer str
    keywords = ['canvas' , 'draw', 'circle', 'rectangle', 'as', 'at']
    lexer = Lexer.new
    lexer.add_ignore(/\s+/)
    keywords.each do |kw|
      lexer.add_keyword kw
    end
    lexer.add_token(/\d+/, :NUMBER)
    lexer.add_token(/\w+/, :WORD)
    lexer.start str
    return lexer
  end

---- footer
if $0 == __FILE__
  parser = DrawShapeParser.new
  file_path = ARGV[0] || "example.txt"
  file = File.open(file_path, "rb")
  contents = file.read
  file.close
  puts "Parsing:\n" + contents.to_s
  puts
  puts 'Result:'
  begin
    parser.parse(contents)
  rescue ParseError
    puts $!
  end
  puts 'End:'
end
