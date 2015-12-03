
class DrawShapeParser
  rule
    target:   methods
            | methods target

    methods:  draw
            | declare

    draw:     'draw' shape { val[1].draw }

    declare:  WORD 'as' shape { @shapes[val[0]] = val[2] }

    shape:    'circle' NUMBER { result = Circle.new val[1] }
            | 'rectangle' NUMBER NUMBER { result = Rectangle.new val[1], val[2] }
            | WORD { result = @shapes[val[0]] }
end

---- header
require "./lexer.rb"
require "./shapes.rb"

---- inner
  def parse(str)
    @shapes = Hash.new
    @lexer = make_lexer str
    do_parse
  end

  def next_token
    @lexer.next_token
  end

  def make_lexer str
    keywords = ['draw', 'circle', 'rectangle', 'as']
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
  str = ARGV[0] || "draw circle 50 a as rectangle 2 3 draw a"
  puts 'Parsing: ' + str.to_s
  puts 'Result:'
  begin
    parser.parse(str)
  rescue ParseError
    puts $!
  end
  puts 'End:'
end
