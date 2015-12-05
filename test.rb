#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'

require "./lexer.rb"
require "./shapes.rb"
require "./bmp/writer.rb"

class DrawShapeParser < Racc::Parser

module_eval(<<'...end draw_bmp_parser.y/module_eval...', 'draw_bmp_parser.y', 36)
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

...end draw_bmp_parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    24,    24,    19,    20,    18,    12,    12,    16,    17,    18,
     9,    10,    16,    17,     9,    10,    12,    13,    12,    12,
    12,     3,     4,    12,    12 ]

racc_action_check = [
    15,    20,    10,    10,    19,    15,    20,    19,    19,     9,
     6,     6,     9,     9,     2,     2,    11,     4,     3,    16,
    17,     0,     1,    23,    26 ]

racc_action_pointer = [
    19,    22,    11,     9,    17,   nil,     7,   nil,   nil,     5,
    -3,     7,   nil,   nil,   nil,    -4,    10,    11,   nil,     0,
    -3,   nil,   nil,    14,   nil,   nil,    15,   nil,   nil,   nil,
   nil ]

racc_action_default = [
   -16,   -16,   -16,   -16,   -16,    -1,    -3,    -5,    -6,   -16,
   -16,   -16,   -15,    31,    -4,   -16,   -16,   -16,   -12,   -16,
   -16,    -2,    -7,   -16,   -14,   -10,   -16,    -8,    -9,   -13,
   -11 ]

racc_goto_table = [
    11,    15,    22,     2,     1,     5,   nil,    28,    21,    14,
   nil,    27,   nil,    25,    26,   nil,   nil,   nil,   nil,   nil,
    29,   nil,   nil,    30 ]

racc_goto_check = [
     4,     8,     9,     2,     1,     3,   nil,     9,     4,     3,
   nil,     8,   nil,     4,     4,   nil,   nil,   nil,   nil,   nil,
     4,   nil,   nil,     4 ]

racc_goto_pointer = [
   nil,     4,     3,     3,    -3,   nil,   nil,   nil,    -8,   -13 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,    23,     6,     7,     8,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  2, 11, :_reduce_none,
  3, 12, :_reduce_2,
  1, 13, :_reduce_none,
  2, 13, :_reduce_none,
  1, 15, :_reduce_none,
  1, 15, :_reduce_none,
  3, 16, :_reduce_7,
  3, 17, :_reduce_8,
  3, 17, :_reduce_9,
  2, 18, :_reduce_10,
  3, 18, :_reduce_11,
  1, 18, :_reduce_12,
  2, 19, :_reduce_13,
  1, 19, :_reduce_14,
  1, 14, :_reduce_15 ]

racc_reduce_n = 16

racc_shift_n = 31

racc_token_table = {
  false => 0,
  :error => 1,
  "canvas" => 2,
  "draw" => 3,
  :WORD => 4,
  "as" => 5,
  "at" => 6,
  "circle" => 7,
  "rectangle" => 8,
  :NUMBER => 9 }

racc_nt_base = 10

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"canvas\"",
  "\"draw\"",
  "WORD",
  "\"as\"",
  "\"at\"",
  "\"circle\"",
  "\"rectangle\"",
  "NUMBER",
  "$start",
  "start",
  "canvas",
  "methods",
  "number",
  "method",
  "draw",
  "declare",
  "shape",
  "point" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'draw_bmp_parser.y', 6)
  def _reduce_2(val, _values, result)
     @bitmap = BMP::Writer.new val[1], val[2] 
    result
  end
.,.,

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

module_eval(<<'.,.,', 'draw_bmp_parser.y', 14)
  def _reduce_7(val, _values, result)
     val[1].draw @bitmap, val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'draw_bmp_parser.y', 16)
  def _reduce_8(val, _values, result)
     @shapes[val[0]] = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'draw_bmp_parser.y', 17)
  def _reduce_9(val, _values, result)
     @points[val[0]] = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'draw_bmp_parser.y', 19)
  def _reduce_10(val, _values, result)
     result = Circle.new val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'draw_bmp_parser.y', 20)
  def _reduce_11(val, _values, result)
     result = Rectangle.new val[1], val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'draw_bmp_parser.y', 21)
  def _reduce_12(val, _values, result)
     result = @shapes[val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'draw_bmp_parser.y', 23)
  def _reduce_13(val, _values, result)
     result = Point.new val[0], val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'draw_bmp_parser.y', 24)
  def _reduce_14(val, _values, result)
     result = @points[val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'draw_bmp_parser.y', 26)
  def _reduce_15(val, _values, result)
     result = val[0].to_i 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class DrawShapeParser

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
