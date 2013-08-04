require_relative '../lib/css.rb'

require 'minitest/unit'
require 'minitest/autorun'
require 'nokogiri'

class DescendantSelectorTest < MiniTest::Unit::TestCase

  def test_can_select_B_descendants_of_A
    doc = Nokogiri.XML "<a><b/><b/></a>"
    selector = "a b"
    assert Css.select(doc, selector).count == 2
  end

  def test_can_select_different_numbers_of_B_descendants_of_A
    doc = Nokogiri.XML "<a><b/><b/><b/></a>"
    selector = "a b"
    assert Css.select(doc, selector).count == 3
  end

  def test_can_select_different_numbers_of_C_descendants_of_A
    doc = Nokogiri.XML "<a><c/><c/><c/></a>"
    selector = "a c"
    assert Css.select(doc, selector).count == 3
  end

  def test_can_select_names_as_descendants
    doc = Nokogiri.XML "<a><cat/><cat/><cat/></a>"
    selector = "a cat"
    assert Css.select(doc, selector).count == 3
  end

  def test_can_actually_select_descendants
    doc = Nokogiri.XML "<root><a><b/><b/></a><b/></root>"
    selector = "a b"
    assert Css.select(doc, selector).count == 2
  end
end
