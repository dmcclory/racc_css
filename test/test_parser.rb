require_relative '../lib/css.rb'

require 'minitest/unit'
require 'minitest/autorun'

class CssParserTests < MiniTest::Unit::TestCase

  def assert_parses_to selector, expect_tree
    result_tree = Css::Parser.new.parse(selector)
    assert_equal expect_tree, result_tree
  end
  
  def test_element_gets_parse_tree
    assert_parses_to [[:name,"a"]],
      [:selectors_group,
        [:selector,
          [:simple_selector_sequence,
            [:element_name, "a" ]
      ] ] ]
  end

  def test_descandant_elements_use_combinator
    assert_parses_to [[:name, 'a'], [:S, ' '], [:name, 'b']],
      [:selectors_group,
        [:selector,
          [:simple_selector_sequence,
            [:element_name, "a" ]
          ],
          [:combinator, " "],
          [:simple_selector_sequence,
            [:element_name, "b"]
          ]
        ]
      ]
  end

  def test_descendent_combinators_can_chain
     assert_parses_to [[:name, 'a'], [:S, ' '], [:name, 'b'], [:S, ' '], [:name, 'c']],
     [:selectors_group,
        [:selector,
            [:simple_selector_sequence, [:element_name, "a"]],
            [:combinator, " "],
            [:simple_selector_sequence, [:element_name, "b"]],
            [:combinator, " "],
            [:simple_selector_sequence, [:element_name, "c"]]]]
  end
end
