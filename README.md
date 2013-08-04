
this is a demo that shows how to use Racc and Rex. You can think of it as a toy version of Nokogiri's CSS selectors

it implements:

- element selector
  - 'a' -> selects all 'a' elements
- '#' id selector  
  - 'a#foo' -> selects all a elements with id = 'foo'
- '.' class selector
  - 'a.bar' -> selects all a elements with class = 'bar'
- attribute selector
  - 'a[baz = 'superrad'] -> selects all a elements with baz set to 'superrad'
- descendant combinator
  - a b -> selects all b elements that have an 'a' ancestor

it also implements selector grouping:
  a, b c, d#e -> returns all 'a' elements, 'c' elements with 'b' ancestors, and 'd' elements with id = 'e' 
