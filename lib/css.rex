module Css
class Lexer

rule

 a  { [:name, text] }
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
