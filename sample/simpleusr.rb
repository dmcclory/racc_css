require_relative 'simple.rex.rb'

f = FooLexer.new

input = File.read 'sample/simple.input'

puts f.tokens(input).inspect
