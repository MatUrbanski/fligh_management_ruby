# frozen_string_literal: true

require 'test_helper'

class SeatsGeneratorTest < Minitest::Test
  def setup
    @seats_generator = SeatsGenerator.new
  end

  def test_basic
    seats = @seats_generator.create_seats(2, 4, 1)

    assert_equal(%w[1A 1B 1C 1D 2A 2B 2C 2D], seats)
  end
end
