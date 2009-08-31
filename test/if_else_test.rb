require File.dirname(__FILE__) + '/helper'

class IfElseTest < Test::Unit::TestCase
  include Liquid

  def test_if
    assert_template_result('  ',' {% if false %} this text should not go into the output {% end %} ')
    assert_template_result('  this text should go into the output  ',
              ' {% if true %} this text should go into the output {% end %} ')
    assert_template_result('  you rock ?','{% if false %} you suck {% end %} {% if true %} you rock {% end %}?')
  end

  def test_if_else
    assert_template_result(' YES ','{% if false %} NO {% else %} YES {% end %}')
    assert_template_result(' YES ','{% if true %} YES {% else %} NO {% end %}')
    assert_template_result(' YES ','{% if "foo" %} YES {% else %} NO {% end %}')
  end
  
  def test_if_boolean
    assert_template_result(' YES ','{% if var %} YES {% end %}', 'var' => true)    
  end        
  
  def test_if_or
    assert_template_result(' YES ','{% if a or b %} YES {% end %}', 'a' => true, 'b' => true)    
    assert_template_result(' YES ','{% if a or b %} YES {% end %}', 'a' => true, 'b' => false)    
    assert_template_result(' YES ','{% if a or b %} YES {% end %}', 'a' => false, 'b' => true)    
    assert_template_result('',     '{% if a or b %} YES {% end %}', 'a' => false, 'b' => false)        

    assert_template_result(' YES ','{% if a or b or c %} YES {% end %}', 'a' => false, 'b' => false, 'c' => true)    
    assert_template_result('',     '{% if a or b or c %} YES {% end %}', 'a' => false, 'b' => false, 'c' => false)        
  end
  
  def test_if_or_with_operators
    assert_template_result(' YES ','{% if a == true or b == true %} YES {% end %}', 'a' => true, 'b' => true)    
    assert_template_result(' YES ','{% if a == true or b == false %} YES {% end %}', 'a' => true, 'b' => true)    
    assert_template_result('','{% if a == false or b == false %} YES {% end %}', 'a' => true, 'b' => true)    
  end     
  
  def test_if_and
    assert_template_result(' YES ','{% if true and true %} YES {% end %}')    
    assert_template_result('','{% if false and true %} YES {% end %}')    
    assert_template_result('','{% if false and true %} YES {% end %}')    
  end
  
  
  def test_hash_miss_generates_false
    assert_template_result('','{% if foo.bar %} NO {% end %}', 'foo' => {})
  end
  
  def test_if_from_variable
    assert_template_result('','{% if var %} NO {% end %}', 'var' => false)
    assert_template_result('','{% if var %} NO {% end %}', 'var' => nil)
    assert_template_result('','{% if foo.bar %} NO {% end %}', 'foo' => {'bar' => false})
    assert_template_result('','{% if foo.bar %} NO {% end %}', 'foo' => {})
    assert_template_result('','{% if foo.bar %} NO {% end %}', 'foo' => nil)
    assert_template_result('','{% if foo.bar %} NO {% end %}', 'foo' => true)
    
    assert_template_result(' YES ','{% if var %} YES {% end %}', 'var' => "text")
    assert_template_result(' YES ','{% if var %} YES {% end %}', 'var' => true)
    assert_template_result(' YES ','{% if var %} YES {% end %}', 'var' => 1)
    assert_template_result(' YES ','{% if var %} YES {% end %}', 'var' => {})
    assert_template_result(' YES ','{% if var %} YES {% end %}', 'var' => [])
    assert_template_result(' YES ','{% if "foo" %} YES {% end %}')
    assert_template_result(' YES ','{% if foo.bar %} YES {% end %}', 'foo' => {'bar' => true})
    assert_template_result(' YES ','{% if foo.bar %} YES {% end %}', 'foo' => {'bar' => "text"})
    assert_template_result(' YES ','{% if foo.bar %} YES {% end %}', 'foo' => {'bar' => 1 })
    assert_template_result(' YES ','{% if foo.bar %} YES {% end %}', 'foo' => {'bar' => {} })
    assert_template_result(' YES ','{% if foo.bar %} YES {% end %}', 'foo' => {'bar' => [] })
    
    assert_template_result(' YES ','{% if var %} NO {% else %} YES {% end %}', 'var' => false)
    assert_template_result(' YES ','{% if var %} NO {% else %} YES {% end %}', 'var' => nil)
    assert_template_result(' YES ','{% if var %} YES {% else %} NO {% end %}', 'var' => true)
    assert_template_result(' YES ','{% if "foo" %} YES {% else %} NO {% end %}', 'var' => "text")
    
    assert_template_result(' YES ','{% if foo.bar %} NO {% else %} YES {% end %}', 'foo' => {'bar' => false})
    assert_template_result(' YES ','{% if foo.bar %} YES {% else %} NO {% end %}', 'foo' => {'bar' => true})
    assert_template_result(' YES ','{% if foo.bar %} YES {% else %} NO {% end %}', 'foo' => {'bar' => "text"})
    assert_template_result(' YES ','{% if foo.bar %} NO {% else %} YES {% end %}', 'foo' => {'notbar' => true})
    assert_template_result(' YES ','{% if foo.bar %} NO {% else %} YES {% end %}', 'foo' => {})
    assert_template_result(' YES ','{% if foo.bar %} NO {% else %} YES {% end %}', 'notfoo' => {'bar' => true})
  end
  
  def test_nested_if
    assert_template_result('', '{% if false %}{% if false %} NO {% end %}{% end %}')
    assert_template_result('', '{% if false %}{% if true %} NO {% end %}{% end %}')
    assert_template_result('', '{% if true %}{% if false %} NO {% end %}{% end %}')
    assert_template_result(' YES ', '{% if true %}{% if true %} YES {% end %}{% end %}')
    
    assert_template_result(' YES ', '{% if true %}{% if true %} YES {% else %} NO {% end %}{% else %} NO {% end %}')
    assert_template_result(' YES ', '{% if true %}{% if false %} NO {% else %} YES {% end %}{% else %} NO {% end %}')
    assert_template_result(' YES ', '{% if false %}{% if true %} NO {% else %} NONO {% end %}{% else %} YES {% end %}')
    
  end
  
  def test_comparisons_on_null
    assert_template_result('','{% if null < 10 %} NO {% end %}')
    assert_template_result('','{% if null <= 10 %} NO {% end %}')
    assert_template_result('','{% if null >= 10 %} NO {% end %}')
    assert_template_result('','{% if null > 10 %} NO {% end %}')

    assert_template_result('','{% if 10 < null %} NO {% end %}')
    assert_template_result('','{% if 10 <= null %} NO {% end %}')
    assert_template_result('','{% if 10 >= null %} NO {% end %}')
    assert_template_result('','{% if 10 > null %} NO {% end %}')
  end
  
  def test_else_if
    assert_template_result('0','{% if 0 == 0 %}0{% elsif 1 == 1%}1{% else %}2{% end %}')
    assert_template_result('1','{% if 0 != 0 %}0{% elsif 1 == 1%}1{% else %}2{% end %}')
    assert_template_result('2','{% if 0 != 0 %}0{% elsif 1 != 1%}1{% else %}2{% end %}')
    
    assert_template_result('elsif','{% if false %}if{% elsif true %}elsif{% end %}')    
  end
  
  def test_syntax_error_no_variable
    assert_raise(SyntaxError){ assert_template_result('', '{% if jerry == 1 %}')}
  end
  
  def test_syntax_error_no_expression
    assert_raise(SyntaxError) { assert_template_result('', '{% if %}') }
  end
  
  def test_if_with_custom_condition
    Condition.operators['contains'] = :[]
    
    assert_template_result('yes', %({% if 'bob' contains 'o' %}yes{% end %}))
    assert_template_result('no', %({% if 'bob' contains 'f' %}yes{% else %}no{% end %}))
  ensure
    Condition.operators.delete 'contains'
  end
end