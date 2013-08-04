require 'nokogiri'
require 'css.rex.rb'

module Css

  extend self

  def select(document, selector)
    document.to_s.scan(selector.chars.to_a.last)
  end

end

