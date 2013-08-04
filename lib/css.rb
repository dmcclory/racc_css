require 'nokogiri'
require 'css.rex.rb'

module Css

  extend self

  def parse_and_interpret(selector)
    lambda { |e| e.name == selector.chars.to_a.last }
  end

  def traverse_select(document, &block)
    array = []
    document.traverse {|e|
      array << e if block.call(e)
    }
    return array
  end

  def select(document, selector)
    selector_func = parse_and_interpret(selector)
    traverse_select(document) { |e| 
      selector_func.call(e)
    }
  end

end

