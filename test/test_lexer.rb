require_relative '../lib/css.rb'

require 'minitest/unit'
require 'minitest/autorun'
require 'nokogiri'

class CssLexerTest < MiniTest::Unit::TestCase

  def assert_tokenizes_to selector, expect
    result = Css::Lexer.new.tokens(selector)
    assert_equal expect, result, "expected selector #{selector} to tokenize to #{expect.inspect}, but was #{result.inspect}"
  end

  def test_names_get_name
    assert_tokenizes_to "a", [[:name, "a"]]
  end

end
