require 'nokogiri'
require 'css.rex.rb'
require 'css.tab.rb'

module Css

  extend self

  def select(document, selector)
    selector_func = parse_and_interpret(selector)
    traverse_select(document) { |e| 
      selector_func.call(e)
    }
  end

  def parse_and_interpret(selector)
    names = selector.split(" ").reverse
    lambda { |e| 
      ancestor_names = e.ancestors.map {|a| a.name }.push e.name
      names.all? { |n| ancestor_names.include? n }
    }
  end

  def traverse_select(document, &block)
    array = []
    document.traverse {|e|
      array << e if block.call(e)
    }
    return array
  end
end

