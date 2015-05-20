require_relative '../test_helper'

class RulersArrayTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def array
    [1, 3, 7, 9]
  end

  def test_average
    assert_equal array.average, 5
  end

  def test_sum
    assert_equal array.sum, 20
  end
end
