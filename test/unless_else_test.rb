require File.dirname(__FILE__) + '/helper'

class UnlessElseTest < Test::Unit::TestCase
  include Liquid

  def test_unless
    assert_template_result('  ',' {% unless true %} this text should not go into the output {% end %} ')
    assert_template_result('  this text should go into the output  ',
              ' {% unless false %} this text should go into the output {% end %} ')
    assert_template_result('  you rock ?','{% unless true %} you suck {% end %} {% unless false %} you rock {% end %}?')
  end

  def test_unless_else
    assert_template_result(' YES ','{% unless true %} NO {% else %} YES {% end %}')
    assert_template_result(' YES ','{% unless false %} YES {% else %} NO {% end %}')
    assert_template_result(' YES ','{% unless "foo" %} NO {% else %} YES {% end %}')
  end

  def test_unless_in_loop
    assert_template_result '23', '{% for i in choices %}{% unless i %}{{ forloop.index }}{% end %}{% end %}', 'choices' => [1, nil, false]
  end

  def test_unless_else_in_loop
    assert_template_result ' TRUE  2  3 ', '{% for i in choices %}{% unless i %} {{ forloop.index }} {% else %} TRUE {% end %}{% end %}', 'choices' => [1, nil, false]
  end

end