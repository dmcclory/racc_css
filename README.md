
this is a demo that shows how to use Racc and Rex. You can think of it as a toy version of Nokogiri's CSS selectors

it implements:

```
# element selector
Css.select doc, 'a' 
=> selects all 'a' elements

# '#' id selector  
Css.select doc, 'a#foo'
=> selects all a elements with id = 'foo'

#'.' class selector
Css.select doc, 'a.bar' 
=> selects all a elements with class = 'bar'

#attribute selector
Css.select doc, 'a[baz = 'superrad']
=> selects all a elements with baz set to 'superrad'

# descendant combinator
Css.select doc, 'a b'
=> selects all b elements that have an 'a' ancestor

#selector grouping:
Css.select doc, 'a, b c, d#e'
=> returns all 'a' elements, 'c' elements with 'b' ancestors, and 'd' elements with id = 'e' 
```

# Hacking

```
rake build - rebuild the grammar and lexer
rake test - runs the tests
rake - rebuilds the grammar and lexer and runs the test
```
