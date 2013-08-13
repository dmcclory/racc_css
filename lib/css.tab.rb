#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.9
# from Racc grammer file "".
#

require 'racc/parser.rb'
module Css
  class Parser < Racc::Parser

module_eval(<<'...end css.racc/module_eval...', 'css.racc', 43)

def parse tokens
  @tokens = tokens
  do_parse
end

def next_token
  @tokens.shift
end
...end css.racc/module_eval...
##### State transition tables begin ###

racc_action_table = [
    21,     7,    10,    11,     7,    10,    11,     7,    10,    11,
     7,    10,    11,     7,    10,    11,    10,    11,    16,    20,
    16,    18,    13,    12,    19 ]

racc_action_check = [
    13,    13,    13,    13,    15,    15,    15,    21,    21,    21,
     0,     0,     0,    23,    23,    23,     5,     5,    14,    12,
     4,    10,     3,     1,    11 ]

racc_action_pointer = [
     6,    23,   nil,    20,    17,    11,   nil,   nil,   nil,   nil,
    17,    20,    19,    -3,    15,     0,   nil,   nil,   nil,   nil,
   nil,     3,   nil,     9,   nil,   nil,   nil ]

racc_action_default = [
   -18,   -18,    -1,    -2,    -5,    -9,   -11,   -12,   -13,   -14,
   -18,   -18,   -18,   -18,    -6,   -18,   -17,   -10,   -15,   -16,
    27,   -18,    -4,   -18,    -7,    -3,    -8 ]

racc_goto_table = [
     2,    15,    24,    14,     1,    17,   nil,   nil,   nil,   nil,
    26,    23,   nil,    22,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    25 ]

racc_goto_check = [
     2,     6,     4,     5,     1,     8,   nil,   nil,   nil,   nil,
     4,     6,   nil,     2,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     2 ]

racc_goto_pointer = [
   nil,     4,     0,   nil,   -13,    -1,    -3,   nil,     0,   nil,
   nil ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,   nil,   nil,     5,     6,     8,
     9 ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 8, :_reduce_none,
  1, 9, :_reduce_2,
  4, 9, :_reduce_3,
  3, 9, :_reduce_4,
  1, 10, :_reduce_5,
  2, 10, :_reduce_6,
  2, 12, :_reduce_7,
  3, 12, :_reduce_8,
  1, 11, :_reduce_9,
  2, 11, :_reduce_10,
  1, 11, :_reduce_11,
  1, 14, :_reduce_12,
  1, 15, :_reduce_13,
  1, 15, :_reduce_14,
  2, 16, :_reduce_15,
  2, 17, :_reduce_16,
  1, 13, :_reduce_17 ]

racc_reduce_n = 18

racc_shift_n = 27

racc_token_table = {
  false => 0,
  :error => 1,
  :COMMA => 2,
  :S => 3,
  :name => 4,
  "." => 5,
  "#" => 6 }

racc_nt_base = 7

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "COMMA",
  "S",
  "name",
  "\".\"",
  "\"#\"",
  "$start",
  "start",
  "selectors_group",
  "selector",
  "simple_selector_sequence",
  "annoying_bit",
  "combinator",
  "element_name",
  "modifier",
  "class",
  "id" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'css.racc', 7)
  def _reduce_2(val, _values, result)
     result = [:selectors_group, *val] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 8)
  def _reduce_3(val, _values, result)
     result = [:selectors_group, *val] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 9)
  def _reduce_4(val, _values, result)
     result = [:selectors_group, *val] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 12)
  def _reduce_5(val, _values, result)
     result = [:selector, *val] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 13)
  def _reduce_6(val, _values, result)
    first, *rest = *val; rest.flatten!(1); result =  [:selector, first, *rest] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 16)
  def _reduce_7(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 17)
  def _reduce_8(val, _values, result)
     previous_combinators = val.shift; result = previous_combinators + val 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 20)
  def _reduce_9(val, _values, result)
     result = [:simple_selector_sequence, *val] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 21)
  def _reduce_10(val, _values, result)
     first, *rest = *val; rest.flatten(1); result = [:simple_selector_sequence, first, *rest ]  
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 22)
  def _reduce_11(val, _values, result)
     first, *rest = *val; rest.flatten(1); result = [:simple_selector_sequence, first, *rest ]  
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 25)
  def _reduce_12(val, _values, result)
     result = [:element_name, *val] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 28)
  def _reduce_13(val, _values, result)
     result = [:class, val.flatten(1)] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 29)
  def _reduce_14(val, _values, result)
     result = [:id, val.flatten(1) ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 32)
  def _reduce_15(val, _values, result)
    result = [:name, val.last] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 35)
  def _reduce_16(val, _values, result)
    result = [:name, val.last] 
    result
  end
.,.,

module_eval(<<'.,.,', 'css.racc', 38)
  def _reduce_17(val, _values, result)
     result = [:combinator, *val] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Css
