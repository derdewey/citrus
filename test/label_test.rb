require File.expand_path('../helper', __FILE__)

class LabelTest < Test::Unit::TestCase

  def test_terminal?
    rule = Label.new
    assert_equal(false, rule.terminal?)
  end

  def test_match
    rule = Label.new('a', 'label')

    match = rule.match(input('a'))
    assert(match)
    assert_equal(:label, match.name)
  end

  def test_to_s
    rule = Label.new('a', 'label')
    assert_equal('label:"a"', rule.to_s)

    rule = Label.new(Sequence.new(%w< a b >), 'label')
    assert_equal('label:("a" "b")', rule.to_s)
  end

end
