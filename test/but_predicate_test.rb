require File.expand_path('../helper', __FILE__)

class ButPredicateTest < Test::Unit::TestCase

  def test_terminal?
    rule = ButPredicate.new
    assert_equal(false, rule.terminal?)
  end

  def test_match
    rule = ButPredicate.new('a')

    match = rule.match(input('b'))
    assert(match)
    assert_equal('b', match)
    assert_equal(1, match.length)

    match = rule.match(input('bbba'))
    assert(match)
    assert_equal('bbb', match)
    assert_equal(3, match.length)

    match = rule.match(input('a'))
    assert_equal(nil, match)

    # ButPredicate must match at least one character.
    match = rule.match(input(''))
    assert_equal(nil, match)
  end

  def test_to_s
    rule = ButPredicate.new('a')
    assert_equal('~"a"', rule.to_s)
  end

end