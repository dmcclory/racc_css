class FooLexer

macro
  nl \n|\r\n|\r|\f
  w  [\s]+
  surrounder  \(|\)|\{|\}\[|\]

rule

  [A-Z]+       {    [:uppercase, text] }
  [a-z]+       {    [:lowercase, text] }
  {nl}         {    [:newline, text]   }
  {w}          {    [:whitespace, text] }
  {surrounder} { [:surrounder, text] }
  [[:punct:]]  {  [:punctuation, text] }
  .            {  [:else, text] }

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
