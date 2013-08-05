require_relative '../lib/css.rb'

require 'minitest/unit'
require 'minitest/autorun'

class CssParserTests < MiniTest::Unit::TestCase

  def assert_parses_to selector, expect_tree
    result_tree = Css::Parser.new.parse(selector)
    assert_equal expect_tree, result_tree
  end
  
  def test_element_gets
    assert_parses_to [[:name,"a"]],
      [:selectors_group,
        [:selector,
          [:simple_selector_sequence,
            [:element_name, "a" ]
      ] ] ]
  end
end
