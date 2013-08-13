require_relative '../lib/css.rb'

require 'minitest/unit'
require 'minitest/autorun'

class IdSelectorTests < MiniTest::Unit::TestCase

  def test_can_select_element_with_an_id
    doc = Nokogiri.XML "<root><foo><a id='so_cool'/></foo></root>"
    result = Css.select doc, 'a#so_cool'
    assert_equal 'a', result.first.name
  end 

  def test_can_have_bare_id
    doc = Nokogiri.XML "<root><a><b id='brydon'/></a></root>"
    result = Css.select doc, '#brydon'
    assert_equal 'b', result.first.name
  end
end
