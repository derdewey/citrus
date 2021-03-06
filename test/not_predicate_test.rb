require File.expand_path('../helper', __FILE__)

class NotPredicateTest < Test::Unit::TestCase

  def test_terminal?
    rule = NotPredicate.new
    assert_equal(false, rule.terminal?)
  end

  def test_match
    rule = NotPredicate.new('a')

    match = rule.match(input('a'))
    assert_equal(nil, match)

    match = rule.match(input('b'))
    assert(match)
    assert_equal('', match)
    assert_equal(0, match.length)
  end

  def test_to_s
    rule = NotPredicate.new('a')
    assert_equal('!"a"', rule.to_s)
  end

end
