require 'nokogiri'
require 'css.rex.rb'
require 'css.tab.rb'
require 'css_interpreter'

module Css

  extend self

  @@lexer = Lexer.new
  @@parser = Parser.new
  @@interpreter = Interpreter.new

  
  def select(document, selector)
    selector_func = parse_and_interpret(selector)
    traverse_select(document.root) { |e| 
      selector_func.call(e)
    }
  end

  def parse_and_interpret(selector)
    tokens = @@lexer.tokens(selector)
    tree = @@parser.parse tokens
    function = @@interpreter.interpret tree

    return function
  end

  def traverse_select(document, &block)
    array = []
    document.traverse {|e|
      array << e if block.call(e)
    }
    return array
  end
end

