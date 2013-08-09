require_relative '../lib/css'

require 'minitest/unit'
require 'minitest/autorun'

class ClassSelectorTests < MiniTest::Unit::TestCase

  def test_can_select_classes
    selector = "a.rad"
    doc = Nokogiri.XML "<root><a class='not_rad'/><a class='rad'/></root>"
    result = Css.select doc, selector
    assert_equal 1, result.count
  end

end
