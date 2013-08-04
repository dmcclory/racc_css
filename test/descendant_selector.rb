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

end
