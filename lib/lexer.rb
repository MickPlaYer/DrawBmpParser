
class Lexer
  require 'strscan'

  def initialize 
    @rules = []
  end

  def add_ignore pattern
    @rules << [pattern, :SKIP]
  end

  def add_token pattern, token
    @rules << [pattern, token]
  end

  def add_keyword str
    @rules << [Regexp.new(str), str]
  end

  def start str
    @base = StringScanner.new str
  end

  def next_token
    return [false, nil] if @base.empty?
    token = get_token
    return (token[0] == :SKIP) ? next_token : token
  end

  def get_token
    @rules.each do |key, value|
      match = @base.scan(key)
      return [value, match] if match
    end 
    raise "unexpected characters  <#{@base.peek(5)}>"
  end
end