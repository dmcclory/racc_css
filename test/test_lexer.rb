require_relative '../lib/css.rb'

require 'minitest/unit'
require 'minitest/autorun'
require 'nokogiri'

class CssLexerTest < MiniTest::Unit::TestCase

  def assert_tokenizes_to selector, expect
    result = Css::Lexer.new.tokens(selector)
    assert_equal expect, result, "expected selector #{selector} to tokenize to #{expect.inspect}, but was #{result.inspect}"
  end

  def test_nmchar_sequences_get_name_category
    assert_tokenizes_to "a", [[:name, "a"]]
    assert_tokenizes_to "abe", [[:name, "abe"]]
    assert_tokenizes_to "wist-ful", [[:name, "wist-ful"]]
  end

  def test_space_characters
    assert_tokenizes_to " ", [[:S, " "]]
    assert_tokenizes_to "\n  ", [[:S, "\n  "]]
  end

  def test_combinations
    assert_tokenizes_to "a b", [[:name, "a"], [:S, " "], [:name, "b"]]
  end

  def test_class_symbol_tokenizes
    assert_tokenizes_to '.', [['.', '.']]
  end

end
