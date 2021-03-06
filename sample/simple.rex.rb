#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.5
# from lexical definition file "sample/simple.rex".
#++

require 'racc/parser'
class FooLexer < Racc::Parser
  require 'strscan'

  class ScanError < StandardError ; end

  attr_reader   :lineno
  attr_reader   :filename
  attr_accessor :state

  def scan_setup(str)
    @ss = StringScanner.new(str)
    @lineno =  1
    @state  = nil
  end

  def action
    yield
  end

  def scan_str(str)
    scan_setup(str)
    do_parse
  end
  alias :scan :scan_str

  def load_file( filename )
    @filename = filename
    open(filename, "r") do |f|
      scan_setup(f.read)
    end
  end

  def scan_file( filename )
    load_file(filename)
    do_parse
  end


  def next_token
    return if @ss.eos?
    
    # skips empty actions
    until token = _next_token or @ss.eos?; end
    token
  end

  def _next_token
    text = @ss.peek(1)
    @lineno  +=  1  if text == "\n"
    token = case @state
    when nil
      case
      when (text = @ss.scan(/[A-Z]+/))
         action {    [:uppercase, text] }

      when (text = @ss.scan(/[a-z]+/))
         action {    [:lowercase, text] }

      when (text = @ss.scan(/\n|\r\n|\r|\f/))
         action {    [:newline, text]   }

      when (text = @ss.scan(/[\s]+/))
         action {    [:whitespace, text] }

      when (text = @ss.scan(/\(|\)|\{|\}\[|\]/))
         action { [:surrounder, text] }

      when (text = @ss.scan(/[[:punct:]]/))
         action {  [:punctuation, text] }

      when (text = @ss.scan(/./))
         action {  [:else, text] }

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    else
      raise  ScanError, "undefined state: '" + state.to_s + "'"
    end  # case state
    token
  end  # def _next_token

  def tokens str
    scan_setup str
    tokens = []
    while token = next_token
      tokens << token
    end
    return tokens
  end
end # class

if __FILE__ == $0
  exit  if ARGV.size != 1
  filename = ARGV.shift
  rex = FooLexer.new
  begin
    rex.load_file  filename
    while  token = rex.next_token
      p token
    end
  rescue
    $stderr.printf  "%s:%d:%s\n", rex.filename, rex.lineno, $!.message
  end
end
