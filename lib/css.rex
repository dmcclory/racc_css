module Css
class Lexer

macro

nmchar [_a-z0-9-]
w [\ \t\r\n\f]

rule

 {nmchar}+  { [ :name, text] }
 {w}+ { [ :S, text] } 
 .  { [:other, text] }

inner
def tokens str
  scan_setup str
  tokens = []
  while token = next_token
    tokens << token
  end 
  return tokens
end

end
end
