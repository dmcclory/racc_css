require_relative '../lib/css.rb'

require 'minitest/unit'
require 'minitest/autorun'
require 'nokogiri'

class DescendantSelectorTest < MiniTest::Unit::TestCase

  def test_can_select_B_descendants_of_A
    doc = Nokogiri.XML "<a><b/><b/></a>"
    selector = "a b"
    result = Css.select(doc, selector)
    assert_equal 2, result.count, "Expected 2, but there were #{result.count}"
  end

  def test_can_select_different_numbers_of_B_descendants_of_A
    doc = Nokogiri.XML "<a><b/><b/><b/></a>"
    selector = "a b"
    assert_equal 3, Css.select(doc, selector).count
  end

  def test_can_select_different_numbers_of_C_descendants_of_A
    doc = Nokogiri.XML "<a><c/><c/><c/></a>"
    selector = "a c"
    assert_equal 3, Css.select(doc, selector).count
  end

  def test_can_select_names_as_descendants
    doc = Nokogiri.XML "<a><cat/><cat/><cat/></a>"
    selector = "a cat"
    assert 3, Css.select(doc, selector).count
  end

  def test_can_actually_select_descendants
    doc = Nokogiri.XML "<root><a><b/><b/></a><b/></root>"
    selector = "a b"
    assert_equal 2, Css.select(doc, selector).count
  end

  def test_can_chain_descendant_seletors
    doc = Nokogiri.XML "<root><a><b><c/></b><d><c/></d></a></root>"
    selector = "a b c"
    result = Css.select(doc, selector)
    assert_equal 1, result.count
  end

  def test_descendant_selectors_can_be_nested_arbitrarily_deeply
    doc = Nokogiri.XML "<root><a><b><c><d><e><f/></e></d></c></b></a></root>"
    selector = "a b c d e f"
    result = Css.select(doc, selector)
    assert_equal 1, result.count
  end

  def test_irrelevant_elements_are_ignored_in_descendant_selector
    doc = Nokogiri.XML "<a><b><c/></b></a>"
    selector = "a c"
    result = Css.select(doc, selector)
    assert_equal 1, result.count
  end

end
