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
      procs = simple_selectors.map { |g|
        process g
      }
      current_element_matches = procs.last
      other_selectors = procs.select {|i| i.is_a? Proc }
      other_selectors.reverse!.shift
      all_other_selectors_match = lambda { |e|
        other_selectors.inject(e) { |element, selector_pred|
          foo = element.ancestors.select { |f| selector_pred.call(f) }.first
          return false if foo.nil?
          foo
        }
      }
      lambda { |e| all_other_selectors_match.call(e) and current_element_matches.call(e) }
    end

    def process_simple_selector_sequence s
      _, *namestuff = *s
      lambdas = namestuff.map do |segment|
        process segment
      end
      lambda { |e| lambdas.all? { |l| l.call e } }
    end

    def process_combinator s
      _, combinator = *s
      return 'descendant'
    end

    def process_element_name s
      _, name = *s
      lambda { |e| e.name == name }
    end

    def process_class s
      name = s.last.last
      lambda { |e| e['class'] == name }
    end

    def process_id s
      name = s.last.last
      lambda { |e| e['id'] == name }
    end
  end
end
