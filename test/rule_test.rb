require File.expand_path('../helper', __FILE__)

class RuleTest < Test::Unit::TestCase

  module MatchModule
    def a_test
      :test
    end
  end

  NumericProc = Proc.new {
    def add_one
      to_i + 1
    end
  }

  NumericModule = Module.new(&NumericProc)

  def test_create
    rule = Rule.eval('"a"')
    assert(rule)
    match = rule.match(input('a'))
    assert(match)
  end

  def test_match_module
    rule = EqualRule.new('a')
    rule.extension = MatchModule
    match = rule.match(input('a'))
    assert(match)
    assert_equal(:test, match.a_test)
  end

  def test_numeric_proc
    rule = EqualRule.new(1)
    rule.extension = NumericProc
    match = rule.match(input('1'))
    assert(match)
    assert_equal(2, match.add_one)
    assert_instance_of(Float, match.to_f)
  end

  def test_numeric_module
    rule = EqualRule.new(1)
    rule.extension = NumericModule
    match = rule.match(input('1'))
    assert(match)
    assert_equal(2, match.add_one)
    assert_instance_of(Float, match.to_f)
  end

end
