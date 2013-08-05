module Css
class Lexer

macro

nmchar [_a-z0-9-]

rule

 {nmchar}+  { [:name, text] }
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
