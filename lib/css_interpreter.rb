require 'sexp_processor'

module Css
  class Interpreter < SexpInterpreter

    def initialize
      super

    end

    def interpret tree
      process tree
    end

    def process_selectors_group s
      _, selectors = *s
      process selectors 
    end

    def process_selector s
      _, *simple_selectors = *s
      loo = simple_selectors.map { |g|
        process g
      }
      lambda { |e| e.ancestors.any? {|a| loo.first.call(a) } and loo.last.call(e) }
    end

    def process_simple_selector_sequence s
      _, namestuff = *s
      process namestuff
    end

    def process_combinator s
      _, combinator = *s
      return 'descendant'
    end

    def process_element_name s
      _, name = *s
      lambda { |e| e.name == name }
    end
  end
end
